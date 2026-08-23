# Purpose: Validate the dedicated LTX 2.3 and native LTX 2.5 IA2V workflow variants.
# Expected behavior: Frame guides, imported audio, native 2.5 models, Crisp Enhance LoRA, upscale, interpolation, and output timing remain correctly wired.
# Related plan: 2026-08-13 - LTX 2.3 and LTX 2.5 IA2V Workflow Variants.
# Preconditions: Run from the repository root with PowerShell 7 or Windows PowerShell.

$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$paths = @{
    Start23 = Join-Path $repo 'workflows\ltx-2-3-ia2v-start-frame\video_ltx2_3_ia2v_start_frame.json'
    Middle23 = Join-Path $repo 'workflows\ltx-2-3-ia2v-start-middle-last-frame\video_ltx2_3_ia2v_start_middle_last_frame.json'
    Start25 = Join-Path $repo 'workflows\ltx-2-5-ia2v\video_ltx2_5_ia2v_start_frame_upscaled_interpolated.json'
    FirstLast25 = Join-Path $repo 'workflows\ltx-2-5-ia2v\video_ltx2_5_ia2v_first_last_frame_upscaled_interpolated.json'
}

function Get-Workflow($path) {
    if (-not (Test-Path -LiteralPath $path)) { throw "Missing workflow: $path" }
    Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
}

function Assert-GraphLinks($workflow) {
    $allNodeIds = @($workflow.nodes | ForEach-Object { $_.id })
    $allLinkIds = @($workflow.links | ForEach-Object { $_[0] })
    foreach ($graph in @($workflow.definitions.subgraphs)) {
        $nodeIds = @($graph.nodes | ForEach-Object { $_.id })
        $allNodeIds += $nodeIds
        if (($nodeIds | Sort-Object -Unique).Count -ne $nodeIds.Count) { throw "Duplicate node ID in $($graph.name)." }
        foreach ($link in $graph.links) {
            $allLinkIds += $link.id
            $target = $graph.nodes | Where-Object { $_.id -eq $link.target_id }
            if ($link.target_id -ge 0 -and -not $target) { throw "Link $($link.id) has a missing target." }
            if ($target -and $target.inputs[$link.target_slot].link -ne $link.id) { throw "Link $($link.id) target metadata differs." }
            if ($link.origin_id -ge 0) {
                $origin = $graph.nodes | Where-Object { $_.id -eq $link.origin_id }
                if (-not $origin) { throw "Link $($link.id) has a missing origin." }
                if ($link.id -notin @($origin.outputs[$link.origin_slot].links)) { throw "Link $($link.id) origin metadata differs." }
            }
        }
    }
    if (($allNodeIds | Sort-Object -Unique).Count -ne $allNodeIds.Count) { throw 'Workflow node IDs must be globally unique.' }
    if (($allLinkIds | Sort-Object -Unique).Count -ne $allLinkIds.Count) { throw 'Workflow link IDs must be globally unique.' }
    $maxNodeId = ($allNodeIds | Measure-Object -Maximum).Maximum
    $maxLinkId = ($allLinkIds | Measure-Object -Maximum).Maximum
    if ($workflow.last_node_id -ne $maxNodeId -or $workflow.last_link_id -ne $maxLinkId) { throw 'Workflow ID counters must match the graph maxima.' }
    foreach ($graph in @($workflow.definitions.subgraphs)) {
        if ($graph.state.lastNodeId -ne $maxNodeId -or $graph.state.lastLinkId -ne $maxLinkId) { throw 'Subgraph ID counters must match the workflow maxima.' }
    }
}

function Assert-LoraNodeMetadata($lora, $setter, $getters) {
    $settings = $lora.widgets_values[2]
    if ($lora.properties.cnr_id -ne 'rgthree-comfy' -or $lora.properties.ver -ne '6b76ee6f2c5a007710b5a16f97c94330d6ecc871') { throw 'The exact supplied rgthree loader metadata must be retained.' }
    if ($lora.properties.'Show Strengths' -ne 'Single Strength' -or $lora.widgets_values[1].type -ne 'PowerLoraLoaderHeaderWidget') { throw 'The LoRA loader must use its supplied single-strength widget shape.' }
    if (-not $settings.on -or $settings.lora -ne 'LTX2.3_Crisp_Enhance.safetensors' -or $settings.strength -ne 1 -or $null -ne $settings.strengthTwo) { throw 'Crisp Enhance LoRA must be enabled at one model strength.' }
    if ($setter.properties.aux_id -ne 'kijai/ComfyUI-KJNodes' -or $setter.properties.previousName -ne 'model') { throw 'Set_model must retain its supplied KJNodes metadata.' }
    if (@($getters | Where-Object { $_.properties.aux_id -ne 'kijai/ComfyUI-KJNodes' }).Count -ne 0) { throw 'Get_model nodes must retain their supplied KJNodes metadata.' }
    if ($setter.widgets_values[0] -ne 'model' -or @($getters | Where-Object { $_.widgets_values[0] -ne 'model' }).Count -ne 0) { throw 'The LoRA model setter and getters must share the model name.' }
    if ($null -ne $setter.outputs[0].links -or @($getters | Where-Object { @($_.outputs[0].links).Count -ne 1 }).Count -ne 0) { throw 'Set_model must be terminal and every Get_model must have one consumer.' }
}

function Assert-LoraModelPath($graph) {
    $lora = @($graph.nodes | Where-Object type -eq 'Power Lora Loader (rgthree)')
    $setter = @($graph.nodes | Where-Object { $_.type -eq 'SetNode' -and $_.title -eq 'Set_model' })
    $getters = @($graph.nodes | Where-Object { $_.type -eq 'GetNode' -and $_.title -eq 'Get_model' })
    $unet = @($graph.nodes | Where-Object type -eq 'UNETLoader')
    $guiders = @($graph.nodes | Where-Object type -eq 'LTXVDualCFGGuider')
    if ($lora.Count -ne 1 -or $setter.Count -ne 1 -or $getters.Count -ne 2 -or $unet.Count -ne 1 -or $guiders.Count -ne 2) {
        throw 'LTX 2.5 must have one LoRA loader, one model setter, two model getters, one transformer, and two guiders.'
    }
    Assert-LoraNodeMetadata $lora[0] $setter[0] $getters
    if ($null -ne $lora[0].inputs[1].link -or $null -ne $lora[0].outputs[1].links) { throw 'Crisp Enhance must modify MODEL only, not CLIP.' }
    $baseLink = @($graph.links | Where-Object id -eq $lora[0].inputs[0].link)
    $setLink = @($graph.links | Where-Object id -eq $setter[0].inputs[0].link)
    if ($baseLink.Count -ne 1 -or $baseLink[0].origin_id -ne $unet[0].id -or $baseLink[0].target_id -ne $lora[0].id -or $baseLink[0].origin_slot -ne 0 -or $baseLink[0].target_slot -ne 0 -or $baseLink[0].type -ne 'MODEL') { throw 'The transformer must feed the LoRA loader.' }
    if ($setLink.Count -ne 1 -or $setLink[0].origin_id -ne $lora[0].id -or $setLink[0].target_id -ne $setter[0].id -or $setLink[0].origin_slot -ne 0 -or $setLink[0].target_slot -ne 0 -or $setLink[0].type -ne 'MODEL') { throw 'The LoRA-adjusted model must feed Set_model.' }
    $unetLinks = @($unet[0].outputs[0].links)
    $loraLinks = @($lora[0].outputs[0].links)
    if ($unetLinks.Count -ne 1 -or $unetLinks[0] -ne $baseLink[0].id -or $loraLinks.Count -ne 1 -or $loraLinks[0] -ne $setLink[0].id) { throw 'The base and LoRA model outputs must have one exact destination each.' }
    $getterLinks = @($getters | ForEach-Object { $id = $_.outputs[0].links[0]; $graph.links | Where-Object id -eq $id })
    if ($getterLinks.Count -ne 2 -or @($getterLinks.target_id | Sort-Object -Unique).Count -ne 2) { throw 'Each model getter must feed a different sampling guider.' }
    if (@($getterLinks | Where-Object { $_.target_id -notin $guiders.id -or $_.target_slot -ne 0 }).Count -ne 0) { throw 'Model getters must feed only guider model inputs.' }
    foreach ($getter in $getters) {
        $link = $graph.links | Where-Object id -eq $getter.outputs[0].links[0]
        $guider = $guiders | Where-Object id -eq $link.target_id
        if ($link.origin_id -ne $getter.id -or $link.origin_slot -ne 0 -or $link.type -ne 'MODEL' -or $guider.inputs[0].link -ne $link.id) { throw 'Getter and guider link metadata must agree.' }
    }
    if (@($graph.links | Where-Object { $_.origin_id -eq $unet[0].id -and $_.target_id -in $guiders.id }).Count -ne 0) { throw 'Sampling guiders must not bypass the LoRA loader.' }
}

function Assert-ExpectedLinks($graph, $expectedLinks) {
    foreach ($expected in $expectedLinks) {
        $link = @($graph.links | Where-Object id -eq $expected.Id)
        if ($link.Count -ne 1 -or $link[0].origin_id -ne $expected.Origin -or $link[0].origin_slot -ne $expected.OriginSlot -or $link[0].target_id -ne $expected.Target -or $link[0].target_slot -ne $expected.TargetSlot -or $link[0].type -ne $expected.Type) {
            throw "First/last guide link $($expected.Id) differs from its preserved route."
        }
    }
}

$start23 = Get-Workflow $paths.Start23
$middle23 = Get-Workflow $paths.Middle23
$start25 = Get-Workflow $paths.Start25
$firstLast25 = Get-Workflow $paths.FirstLast25

if (@($start23.nodes | Where-Object type -eq 'LoadImage').Count -ne 1) { throw 'LTX 2.3 start workflow must have one image input.' }
if (@($start23.nodes | Where-Object type -eq 'LTXVAddGuide').Count -ne 0) { throw 'LTX 2.3 start workflow must not contain middle or last guides.' }
$middleImages = @($middle23.nodes | Where-Object type -eq 'LoadImage')
$middleGuides = @($middle23.nodes | Where-Object type -eq 'LTXVAddGuide')
if ($middleImages.Count -ne 3 -or -not ($middleImages.title -contains 'Load Middle Frame') -or -not ($middleImages.title -contains 'Load Last Frame')) {
    throw 'LTX 2.3 middle workflow must expose start, middle, and last images.'
}
if ($middleGuides.Count -ne 4 -or @($middleGuides | Where-Object { $_.title -match 'Middle' }).Count -ne 2) {
    throw 'LTX 2.3 middle workflow must guide middle and last frames in both passes.'
}
if (@($middleGuides | Where-Object { $_.title -match 'Last' -and $_.widgets_values[0] -eq -1 }).Count -ne 2) {
    throw 'LTX 2.3 last-frame guides must use frame index -1.'
}

foreach ($workflow in @($start25, $firstLast25)) {
    Assert-GraphLinks $workflow
    $graph = $workflow.definitions.subgraphs[0]
    Assert-LoraModelPath $graph
    $types = @($graph.nodes.type)
    if ('LTXVEmptyLatentAudio' -in $types) { throw 'LTX 2.5 IA2V must not use generated empty audio.' }
    foreach ($required in @('TrimAudioDuration', 'LTXVAudioVAEEncode', 'SetLatentNoiseMask', 'LTXVLatentUpsampler', 'VAEDecodeTiled')) {
        if ($required -notin $types) { throw "LTX 2.5 IA2V is missing $required." }
    }
    $loaders = @($graph.nodes | Where-Object { $_.type -in @('UNETLoader', 'VAELoader', 'CLIPLoader', 'LatentUpscaleModelLoader') })
    $values = ($loaders.widgets_values | ConvertTo-Json -Compress -Depth 5)
    foreach ($model in @('ltx-2.5-22b-distilled-transformer', 'ltx-2.5-video-vae', 'ltx-2.5-audio-vae', 'gemma4-12b-with-proj-ltx-2.5', 'ltx-2.5-latent-spatial-upscaler')) {
        if ($values -notmatch [regex]::Escape($model)) { throw "Native LTX 2.5 component is missing: $model" }
    }
    $rtx = $workflow.nodes | Where-Object type -eq 'RTXVideoSuperResolution'
    $rife = $workflow.nodes | Where-Object type -eq 'RifeTensorrt'
    $create = $workflow.nodes | Where-Object type -eq 'CreateVideo'
    $math = $workflow.nodes | Where-Object { $_.type -eq 'ComfyMathExpression' -and $_.widgets_values -eq 'a * 2' }
    if ($rtx.outputs[0].links[0] -ne $rife.inputs[0].link) { throw 'RTX 2x must feed RIFE 2x.' }
    if ($rife.widgets_values[1] -ne 2 -or $rife.outputs[0].links[0] -ne $create.inputs[0].link) { throw 'RIFE 2x must feed CreateVideo.' }
    if (-not $math -or $math.outputs[0].links[0] -ne $create.inputs[2].link) { throw 'CreateVideo must use native FPS multiplied by two.' }
    if ($null -eq $create.inputs[1].link) { throw 'Imported/generated audio output must remain connected to CreateVideo.' }
}

$flGraph = $firstLast25.definitions.subgraphs[0]
$flGuides = @($flGraph.nodes | Where-Object type -eq 'LTXVAddGuide')
if ($flGuides.Count -ne 2 -or @($flGuides | Where-Object { $_.widgets_values[0] -eq -1 }).Count -ne 2) {
    throw 'LTX 2.5 first/last workflow must apply the last frame at -1 in both passes.'
}
if (@($flGraph.nodes | Where-Object type -eq 'LTXVCropGuides').Count -ne 1) { throw 'LTX 2.5 first/last workflow must crop low-resolution guide conditioning before pass two.' }
if (-not ($firstLast25.nodes.title -contains 'Load Last Frame')) { throw 'LTX 2.5 first/last workflow must expose a last-frame loader.' }
$guideLinks = @(
    [pscustomobject]@{ Id = 811; Origin = -10; OriginSlot = 15; Target = 427; TargetSlot = 0; Type = 'IMAGE,MASK' }
    [pscustomobject]@{ Id = 812; Origin = 372; OriginSlot = 0; Target = 427; TargetSlot = 1; Type = 'INT' }
    [pscustomobject]@{ Id = 813; Origin = 360; OriginSlot = 0; Target = 427; TargetSlot = 2; Type = 'INT' }
    [pscustomobject]@{ Id = 814; Origin = 427; OriginSlot = 0; Target = 428; TargetSlot = 0; Type = 'IMAGE' }
    [pscustomobject]@{ Id = 815; Origin = 365; OriginSlot = 0; Target = 429; TargetSlot = 0; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 816; Origin = 365; OriginSlot = 1; Target = 429; TargetSlot = 1; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 817; Origin = 385; OriginSlot = 0; Target = 429; TargetSlot = 2; Type = 'VAE' }
    [pscustomobject]@{ Id = 818; Origin = 357; OriginSlot = 0; Target = 429; TargetSlot = 3; Type = 'LATENT' }
    [pscustomobject]@{ Id = 819; Origin = 428; OriginSlot = 0; Target = 429; TargetSlot = 4; Type = 'IMAGE' }
    [pscustomobject]@{ Id = 820; Origin = 429; OriginSlot = 2; Target = 377; TargetSlot = 0; Type = 'LATENT' }
    [pscustomobject]@{ Id = 821; Origin = 429; OriginSlot = 0; Target = 388; TargetSlot = 1; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 822; Origin = 429; OriginSlot = 1; Target = 388; TargetSlot = 2; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 823; Origin = 429; OriginSlot = 0; Target = 431; TargetSlot = 0; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 824; Origin = 429; OriginSlot = 1; Target = 431; TargetSlot = 1; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 825; Origin = 367; OriginSlot = 0; Target = 431; TargetSlot = 2; Type = 'LATENT' }
    [pscustomobject]@{ Id = 826; Origin = 431; OriginSlot = 0; Target = 430; TargetSlot = 0; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 827; Origin = 431; OriginSlot = 1; Target = 430; TargetSlot = 1; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 828; Origin = 385; OriginSlot = 0; Target = 430; TargetSlot = 2; Type = 'VAE' }
    [pscustomobject]@{ Id = 829; Origin = 349; OriginSlot = 0; Target = 430; TargetSlot = 3; Type = 'LATENT' }
    [pscustomobject]@{ Id = 830; Origin = 428; OriginSlot = 0; Target = 430; TargetSlot = 4; Type = 'IMAGE' }
    [pscustomobject]@{ Id = 831; Origin = 430; OriginSlot = 2; Target = 340; TargetSlot = 0; Type = 'LATENT' }
    [pscustomobject]@{ Id = 832; Origin = 430; OriginSlot = 0; Target = 391; TargetSlot = 1; Type = 'CONDITIONING' }
    [pscustomobject]@{ Id = 833; Origin = 430; OriginSlot = 1; Target = 391; TargetSlot = 2; Type = 'CONDITIONING' }
)
Assert-ExpectedLinks $flGraph $guideLinks

Write-Output 'LTX IA2V workflow variant validation passed.'

# Purpose: Validate the generic MiniMax H3 identity-based face-refine workflow and local assets.
# Expected behavior: Native H3 frames are tracked, refined, stitched, then RTX-upscaled and RIFE-interpolated without replacing original audio.
# Related plan: 2026-08-15 - Add MiniMax H3 Face Refine Variant.
# Preconditions: The paired portable ComfyUI runtime and downloaded FaceRefine assets are present.

$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$comfy = 'C:\ComfyUI_windows_portable\ComfyUI'
$source = 'C:\Users\pjecu\Downloads\civit ai minimax h3 fast workflow with loras (2).json'
$workflowPath = Join-Path $repo 'workflows\minimax-h3-fast-loras-face-refine\minimax_h3_fast_loras_face_refine.json'
$faceModel = Join-Path $comfy 'models\ultralytics\bbox\face_yolov8m.pt'
$personModel = Join-Path $comfy 'models\ultralytics\segm\person_yolov8m-seg.pt'

function Assert-True([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}

function Get-Node($Workflow, [string]$Type, [string]$Title = '') {
    $nodes = @($Workflow.nodes | Where-Object { $_.type -eq $Type -and ($Title -eq '' -or $_.title -eq $Title) })
    Assert-True ($nodes.Count -eq 1) "Expected one $Type node titled '$Title', found $($nodes.Count)."
    return $nodes[0]
}

function Get-LinkTo($Workflow, $Node, [string]$InputName) {
    $slot = [array]::IndexOf(@($Node.inputs.name), $InputName)
    Assert-True ($slot -ge 0) "$($Node.type) is missing input $InputName."
    $link = @($Workflow.links | Where-Object { $_[0] -eq $Node.inputs[$slot].link })
    Assert-True ($link.Count -eq 1) "$($Node.type).$InputName must have one link."
    return $link[0]
}

function Assert-Origin($Workflow, $Target, [string]$InputName, $Origin, [int]$Output, [string]$Type) {
    $link = Get-LinkTo $Workflow $Target $InputName
    Assert-True ($link[1] -eq $Origin.id -and $link[2] -eq $Output -and $link[4] -eq [array]::IndexOf(@($Target.inputs.name), $InputName) -and $link[5] -eq $Type) "Wrong route into $($Target.type).$InputName."
}

function Assert-GraphMetadata($Workflow) {
    $nodeIds = @($Workflow.nodes.id)
    $linkIds = @($Workflow.links | ForEach-Object { $_[0] })
    foreach ($graph in @($Workflow.definitions.subgraphs)) {
        $nodeIds += @($graph.nodes.id); $linkIds += @($graph.links.id)
    }
    Assert-True (($nodeIds | Sort-Object -Unique).Count -eq $nodeIds.Count) 'Node IDs must be globally unique.'
    Assert-True (($linkIds | Sort-Object -Unique).Count -eq $linkIds.Count) 'Link IDs must be globally unique.'
    foreach ($link in $Workflow.links) {
        $origin = $Workflow.nodes | Where-Object id -eq $link[1]
        $target = $Workflow.nodes | Where-Object id -eq $link[3]
        Assert-True ($null -ne $origin -and $null -ne $target) "Root link $($link[0]) has a missing endpoint."
        Assert-True ($link[0] -in @($origin.outputs[$link[2]].links)) "Root link $($link[0]) origin metadata differs."
        Assert-True ($target.inputs[$link[4]].link -eq $link[0]) "Root link $($link[0]) target metadata differs."
    }
    $maxNode = ($nodeIds | Measure-Object -Maximum).Maximum
    $maxLink = ($linkIds | Measure-Object -Maximum).Maximum
    Assert-True ($Workflow.last_node_id -eq $maxNode -and $Workflow.last_link_id -eq $maxLink) 'Root counters must equal graph maxima.'
    foreach ($graph in @($Workflow.definitions.subgraphs)) {
        Assert-True ($graph.state.lastNodeId -eq $maxNode -and $graph.state.lastLinkId -eq $maxLink) 'Subgraph counters must equal graph maxima.'
    }
}

Assert-True (Test-Path -LiteralPath $source) 'Supplied Downloads workflow is missing.'
Assert-True ((Get-FileHash -Algorithm SHA256 -LiteralPath $source).Hash -eq '79432A17B0A1BC619470F0493D22D73E85D7956A69CDC222A4C2F418FF92BD87') 'Supplied Downloads workflow changed.'
Assert-True (Test-Path -LiteralPath $workflowPath) 'Face-refine workflow is missing.'
Assert-True ((Get-FileHash -Algorithm SHA256 -LiteralPath $faceModel).Hash -eq '717923C19B3F4BBF5250B728F1FA6B2CB72A33AED1D236EA9CAF0E21AD943E5F') 'Face detector is missing or changed.'
Assert-True ((Get-FileHash -Algorithm SHA256 -LiteralPath $personModel).Hash -eq 'C8AB26F517173B1FE8342D336A09F443EB61CB08DCBFC78D53FFF4C2547AE81E') 'Person fallback detector is missing or changed.'
Assert-True (Test-Path -LiteralPath (Join-Path $comfy 'custom_nodes\ComfyUI-H3-FaceRefine\__init__.py')) 'FaceRefine nodes are missing.'
Assert-True (Test-Path -LiteralPath (Join-Path $comfy 'custom_nodes\ComfyUI-H3-NativeAudioLock\__init__.py')) 'NativeAudioLock node is missing.'
Assert-True (Test-Path -LiteralPath (Join-Path $comfy 'models\insightface\models\buffalo_l\w600k_r50.onnx')) 'InsightFace buffalo_l recognition model is missing.'
Assert-True (Test-Path -LiteralPath 'C:\ComfyUI_windows_portable\python_embeded\Lib\site-packages\insightface\__init__.py') 'InsightFace package is missing.'

$workflow = Get-Content -Raw -LiteralPath $workflowPath | ConvertFrom-Json
Assert-GraphMetadata $workflow
$native = $workflow.nodes | Where-Object id -eq 105
$identity = Get-Node $workflow 'LoadImage' 'FACE IDENTITY + H3 REF (change this)'
$tracker = Get-Node $workflow 'H3FaceTrackCrop'
$count = Get-Node $workflow 'VHS_GetImageCount'
$condition = Get-Node $workflow 'MiniMaxH3ReferenceToVideo'
$inject = Get-Node $workflow 'H3InjectVideoLatent'
$lock = Get-Node $workflow 'MiniMaxH3NativeAudioLock'
$denoise = Get-Node $workflow 'H3PerFrameDenoise'
$guider = Get-Node $workflow 'BasicGuider' 'Refine guider'
$scheduler = Get-Node $workflow 'BasicScheduler' '6. Refine denoise'
$sample = Get-Node $workflow 'SamplerCustomAdvanced' '7. Refine sample'
$decode = Get-Node $workflow 'VAEDecode' '8. Decode refined crops'
$stitch = Get-Node $workflow 'H3FaceStitch'
$rtx = Get-Node $workflow 'RTXVideoSuperResolution'
$rife = Get-Node $workflow 'RifeTensorrt'
$final = $workflow.nodes | Where-Object { $_.id -eq 137 -and $_.mode -ne 4 }

Assert-True ($tracker.widgets_values[0] -eq 'bbox\face_yolov8m.pt' -and $tracker.widgets_values[1] -eq 0.35 -and $tracker.widgets_values[2] -eq 3) 'Tracker detector settings differ.'
Assert-True ($tracker.widgets_values[5] -eq 'auto_capped_768' -and $tracker.widgets_values[9] -eq 'per_frame' -and $tracker.widgets_values[10] -eq $true -and $tracker.widgets_values[11] -eq 0.28) 'Generic identity tracking settings differ.'
Assert-True ($tracker.widgets_values[13] -eq 'segm\person_yolov8m-seg.pt') 'Person fallback must be enabled.'
Assert-Origin $workflow $tracker 'images' $native 1 'IMAGE'; Assert-Origin $workflow $tracker 'identity_reference' $identity 0 'IMAGE'
Assert-Origin $workflow $count 'images' $native 1 'IMAGE'; Assert-Origin $workflow $condition 'length' $count 0 'INT'
Assert-Origin $workflow $inject 'images' $tracker 0 'IMAGE'; Assert-Origin $workflow $denoise 'transform' $tracker 1 'H3FACEXFORM'
Assert-Origin $workflow $stitch 'transform' $tracker 1 'H3FACEXFORM'; Assert-Origin $workflow $stitch 'base_images' $native 1 'IMAGE'
Assert-Origin $workflow $lock 'audio' $native 2 'AUDIO'; Assert-Origin $workflow $denoise 'av_latent' $lock 1 'LATENT'
Assert-Origin $workflow $guider 'model' $lock 0 'MODEL'; Assert-Origin $workflow $scheduler 'model' $lock 0 'MODEL'
Assert-Origin $workflow $sample 'latent_image' $denoise 0 'LATENT'; Assert-Origin $workflow $decode 'samples' $sample 0 'LATENT'
Assert-Origin $workflow $stitch 'refined_crops' $decode 0 'IMAGE'; Assert-Origin $workflow $rtx 'images' $stitch 0 'IMAGE'
Assert-Origin $workflow $rife 'frames' $rtx 0 'IMAGE'; Assert-Origin $workflow $final 'images' $rife 0 'IMAGE'; Assert-Origin $workflow $final 'audio' $native 2 'AUDIO'
Assert-True ($condition.inputs[10].link -eq $tracker.outputs[4].links[0] -and $condition.inputs[11].link -eq $tracker.outputs[5].links[0]) 'Tracker canvas dimensions must drive refine dimensions.'
Assert-True ($condition.widgets_values[0] -eq $native.widgets_values[0]) 'Generation and refine prompts must start synchronized.'
Assert-True ($scheduler.widgets_values[1] -eq 8 -and $scheduler.widgets_values[2] -eq 0.45) 'Refine scheduler must use 8 steps and 0.45 base denoise.'
Assert-True ($rife.widgets_values[1] -eq 2 -and $final.widgets_values.frame_rate -eq 48) 'RIFE 2x and 48 FPS output must be preserved.'

$nativeFrames = 362; $interpolated = (($nativeFrames - 1) * 2) + 1
Assert-True (($nativeFrames - 5) % 17 -eq 0 -and $interpolated -eq 723) '15-second H3/RIFE frame math differs.'
Assert-True ([Math]::Abs((($nativeFrames - 1) / 24) - (($interpolated - 1) / 48)) -lt 0.000001) 'Interpolation changes duration.'

Write-Output 'PASS: Generic MiniMax H3 face-refine workflow and assets are valid.'

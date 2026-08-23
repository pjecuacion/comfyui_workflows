param(
    [string]$Source = 'C:\Users\pjecu\Downloads\civit ai minimax h3 fast workflow with loras (2).json',
    [string]$Template = 'C:\ComfyUI_windows_portable\ComfyUI\custom_nodes\ComfyUI-H3-FaceRefine\example_workflows\H3_Face_Refine.json',
    [string]$Output = (Join-Path $PSScriptRoot '..\workflows\minimax-h3-fast-loras-face-refine\minimax_h3_fast_loras_face_refine.json')
)

$ErrorActionPreference = 'Stop'

function Copy-Object($Value) {
    return (($Value | ConvertTo-Json -Depth 100) | ConvertFrom-Json)
}

function Reset-Node($Node, [int]$Id, [string]$Title, [double[]]$Position) {
    $copy = Copy-Object $Node
    $copy.id = $Id
    if ($copy.psobject.Properties.Name -contains 'title') { $copy.title = $Title }
    else { $copy | Add-Member -NotePropertyName title -NotePropertyValue $Title }
    $copy.pos = $Position
    $copy.mode = 0
    foreach ($input in @($copy.inputs)) { $input.link = $null }
    foreach ($output in @($copy.outputs)) { $output.links = @() }
    return $copy
}

function Add-Link([int]$FromId, [int]$FromSlot, [int]$ToId, [int]$ToSlot, [string]$Type) {
    $script:NextLink++
    $origin = $script:NodeById[[string]$FromId]
    $target = $script:NodeById[[string]$ToId]
    $origin.outputs[$FromSlot].links = @($origin.outputs[$FromSlot].links) + $script:NextLink
    $target.inputs[$ToSlot].link = $script:NextLink
    $script:Workflow.links = @($script:Workflow.links) + ,@($script:NextLink, $FromId, $FromSlot, $ToId, $ToSlot, $Type)
}

function New-Note([int]$Id, [string]$Title, [string]$Text, [double[]]$Position, [double[]]$Size) {
    return [pscustomobject]@{
        id = $Id; type = 'Note'; pos = $Position; size = $Size; flags = @{}; order = $Id
        mode = 0; inputs = @(); outputs = @(); title = $Title
        properties = [pscustomobject]@{ 'Node name for S&R' = 'Note' }
        widgets_values = @($Text); color = '#432'; bgcolor = '#653'
    }
}

$script:Workflow = Get-Content -Raw -LiteralPath $Source | ConvertFrom-Json
$example = Get-Content -Raw -LiteralPath $Template | ConvertFrom-Json
$subgraph = $script:Workflow.definitions.subgraphs[0]
$sourceNodes = @{}; foreach ($node in $script:Workflow.nodes) { $sourceNodes[[string]$node.id] = $node }
$exampleNodes = @{}; foreach ($node in $example.nodes) { $exampleNodes[[string]$node.id] = $node }
$innerNodes = @{}; foreach ($node in $subgraph.nodes) { $innerNodes[[string]$node.id] = $node }
$prompt = $sourceNodes['105'].widgets_values_named.prompt

$nodes = @()
$identity = Reset-Node $sourceNodes['147'] 164 'FACE IDENTITY + H3 REF (change this)' @(-2060, 6070)
$tracker = Reset-Node $exampleNodes['2'] 165 '1. Track target face' @(-1530, 6070)
$tracker.widgets_values = @('bbox\face_yolov8m.pt', 0.35, 3.0, 512, 512, 'auto_capped_768', 21, 51, 'gaussian', 'per_frame', $true, 0.28, 'largest', 'segm\person_yolov8m-seg.pt', 0.5)
$counter = [pscustomobject]@{ id=166; type='VHS_GetImageCount'; pos=@(-1530,6800); size=@(250,60); flags=@{}; order=20; mode=0; inputs=@([pscustomobject]@{name='images';type='IMAGE';link=$null}); outputs=@([pscustomobject]@{name='count';type='INT';links=@()}); title='Exact native frame count'; properties=[pscustomobject]@{'Node name for S&R'='VHS_GetImageCount'} }
$clip = Reset-Node $innerNodes['13'] 167 'H3 text encoder (same as generation)' @(-1110, 6070)
$clip.widgets_values = @('qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors','minimax','default')
$videoVae = Reset-Node $innerNodes['11'] 168 'H3 video VAE (same as generation)' @(-1110,6220)
$videoVae.widgets_values = @('minimax_h3_video_vae_int8_convrot.safetensors')
$audioVae = Reset-Node $innerNodes['24'] 169 'H3 audio VAE' @(-1110,6320)
$audioVae.widgets_values = @('minimax_h3_audio_vae_fp32.safetensors')
$model = Reset-Node $innerNodes['128'] 170 'H3 model (same as generation)' @(-1110,6440)
$model.widgets_values = @('minimax_h3_fl2va_pruned_fp8_scaled.safetensors','default','default',$false,'auto',$true)
$lora = Reset-Node $innerNodes['152'] 171 'Same generation LoRAs' @(-1110,6650)
$conditioning = Reset-Node $exampleNodes['9'] 172 '2. Refine conditioning (keep prompt synced)' @(-680,6070)
$conditioning.widgets_values = @($prompt,512,512,362,'match')
$conditioning.inputs = @($conditioning.inputs) + [pscustomobject]@{name='length';type='INT';widget=[pscustomobject]@{name='length'};link=$null}
$inject = Reset-Node $exampleNodes['10'] 173 '3. Inject tracked crops' @(-280,6410)
$audioLock = Reset-Node $exampleNodes['13'] 174 '4. Lock generated audio for lipsync' @(40,6410)
$denoise = Reset-Node $exampleNodes['31'] 175 '5. Face-size denoise' @(340,6410)
$guider = Reset-Node $exampleNodes['14'] 176 'Refine guider' @(340,6070)
$sampler = Reset-Node $innerNodes['17'] 177 'Same sampler as generation' @(340,6190)
$noise = Reset-Node $exampleNodes['17'] 178 'Refine seed' @(660,6070)
$noise.widgets_values = @(42,'fixed')
$scheduler = Reset-Node $exampleNodes['16'] 179 '6. Refine denoise' @(660,6190)
$scheduler.widgets_values = @('simple',8,0.45)
$sample = Reset-Node $exampleNodes['18'] 180 '7. Refine sample' @(970,6190)
$decode = Reset-Node $exampleNodes['19'] 181 '8. Decode refined crops' @(1280,6190)
$stitch = Reset-Node $exampleNodes['22'] 182 '9. Stitch face into native frames' @(1540,6070)
$nodes += $identity,$tracker,$counter,$clip,$videoVae,$audioVae,$model,$lora,$conditioning,$inject,$audioLock,$denoise,$guider,$sampler,$noise,$scheduler,$sample,$decode,$stitch
$nodes += New-Note 183 'HOW TO REUSE THIS WORKFLOW' "Change the first frame, last frame, FACE IDENTITY image, and BOTH prompt fields. The identity image should be a clear front-facing human face. This pass refines one identity. Duplicate the whole refine pass for another person." @(-2060,6860) @(500,330)
$nodes += New-Note 184 'DETECTOR LIMIT' "The installed YOLO + InsightFace models work on photographic human faces. They failed on the local Rick and Morty cartoon images. Check the tracker preview/report before paying for the second H3 pass." @(-1520,7000) @(430,230)
$frameNote = Reset-Node $sourceNodes['116'] 185 'Frame Count and Shot Duration' @(-1040,7000)
$frameNote.size = @(480,230)
$frameNote.widgets_values = @("## Frame Count and Shot Duration`n`nMiniMax H3 generates native 24 FPS batches on the 17k+5 grid. Face refinement uses the exact decoded batch count. RIFE 2x produces ((N-1)*2)+1 frames and the final node encodes at 48 FPS, preserving first-to-last-frame duration.")
$nodes += $frameNote
$script:Workflow.nodes = @($script:Workflow.nodes) + $nodes

$script:NodeById = @{}; foreach ($node in $script:Workflow.nodes) { $script:NodeById[[string]$node.id] = $node }
$script:Workflow.links = @($script:Workflow.links | Where-Object { $_[0] -ne 302 })
$sourceNodes['105'].outputs[1].links = @($sourceNodes['105'].outputs[1].links | Where-Object { $_ -ne 302 })
$sourceNodes['138'].inputs[0].link = 302
$stitch.outputs[0].links = @(302)
$script:Workflow.links += ,@(302,182,0,138,0,'IMAGE')
$script:NextLink = [int]$script:Workflow.last_link_id

Add-Link 105 1 165 0 'IMAGE'; Add-Link 164 0 165 1 'IMAGE'
Add-Link 105 1 166 0 'IMAGE'; Add-Link 105 1 182 0 'IMAGE'
Add-Link 164 0 172 3 'IMAGE'; Add-Link 142 0 172 4 'IMAGE'; Add-Link 148 0 172 5 'IMAGE'
Add-Link 165 4 172 10 'INT'; Add-Link 165 5 172 11 'INT'; Add-Link 166 0 172 12 'INT'
Add-Link 167 0 172 0 'CLIP'; Add-Link 168 0 172 1 'VAE'; Add-Link 169 0 172 2 'VAE'
Add-Link 172 1 173 0 'LATENT'; Add-Link 165 0 173 1 'IMAGE'; Add-Link 168 0 173 2 'VAE'
Add-Link 170 0 171 0 'MODEL'; Add-Link 171 0 174 0 'MODEL'; Add-Link 173 0 174 1 'LATENT'
Add-Link 169 0 174 2 'VAE'; Add-Link 105 2 174 3 'AUDIO'
Add-Link 174 0 176 0 'MODEL'; Add-Link 172 0 176 1 'CONDITIONING'; Add-Link 174 0 179 0 'MODEL'
Add-Link 174 1 175 0 'LATENT'; Add-Link 165 1 175 1 'H3FACEXFORM'
Add-Link 178 0 180 0 'NOISE'; Add-Link 176 0 180 1 'GUIDER'; Add-Link 177 0 180 2 'SAMPLER'; Add-Link 179 0 180 3 'SIGMAS'; Add-Link 175 0 180 4 'LATENT'
Add-Link 180 0 181 0 'LATENT'; Add-Link 168 0 181 1 'VAE'
Add-Link 181 0 182 1 'IMAGE'; Add-Link 165 1 182 2 'H3FACEXFORM'

$script:Workflow.groups = @($script:Workflow.groups) + [pscustomobject]@{id=2;title='GENERIC H3 FACE REFINE - ONE IDENTITY';bounding=@(-2100,6000,3980,1260);color='#8b3a3a';font_size=24;flags=@{}}
$script:Workflow.last_node_id = 185
$script:Workflow.last_link_id = $script:NextLink
$subgraph.state.lastNodeId = 185
$subgraph.state.lastLinkId = $script:NextLink
$script:Workflow.revision = [int]$script:Workflow.revision + 1
$script:Workflow.extra.ds.offset = @(1200,-5300)

$destination = [System.IO.Path]::GetFullPath($Output)
[System.IO.Directory]::CreateDirectory([System.IO.Path]::GetDirectoryName($destination)) | Out-Null
$json = $script:Workflow | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText($destination, $json + [Environment]::NewLine, [System.Text.UTF8Encoding]::new($false))
Write-Output $destination

param(
    [string]$RepoRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$ComfyRoot = 'C:\ComfyUI_windows_portable\ComfyUI'
)

$ErrorActionPreference = 'Stop'
$source = Join-Path $ComfyRoot 'custom_nodes\ComfyUI-MiniMax-H3-Turbo\example_workflows\minimax_h3_t2v_turbo.json'
$reference = Join-Path $RepoRoot 'workflows\minimaxh3-fp8\video_minimax_h3_t2v fp8 sageattention rtx upscaled interpolated.json'
$bundle = Join-Path $RepoRoot 'workflows\minimax-h3-turbo'
$upstreamDir = Join-Path $bundle 'upstream'
$output = Join-Path $bundle 'minimax_h3_t2v_turbo_int8_sage_rife48_rtx.json'

New-Item -ItemType Directory -Force -Path $upstreamDir | Out-Null
Copy-Item -LiteralPath $source -Destination (Join-Path $upstreamDir 'minimax_h3_t2v_turbo.json') -Force

$workflow = Get-Content -Raw -LiteralPath $source | ConvertFrom-Json
$old = Get-Content -Raw -LiteralPath $reference | ConvertFrom-Json
$oldNodes = @($old.definitions.subgraphs | ForEach-Object { $_.nodes })

function Get-Node($graph, [int]$id) {
    return $graph.nodes | Where-Object id -eq $id | Select-Object -First 1
}

function Copy-ReferenceNode([string]$type, [int]$id, [double[]]$position) {
    $node = $oldNodes | Where-Object type -eq $type | Select-Object -First 1
    $copy = $node | ConvertTo-Json -Depth 40 | ConvertFrom-Json
    $copy.id = $id
    $copy.pos = $position
    return $copy
}

(Get-Node $workflow 127).widgets_values = @('minimax_h3_fl2va_pruned_int8_convrot.safetensors', 'default')
(Get-Node $workflow 128).widgets_values = @('qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors', 'minimax', 'default')
(Get-Node $workflow 134).widgets_values = @('minimax_h3_turbo_4step_ckpt500.safetensors', 1)
(Get-Node $workflow 92).widgets_values = @('video/MiniMax_H3_Turbo_Upscaled_48fps', 'auto', 'auto')
(Get-Node $workflow 130).widgets_values = @(48, 8)

$rife = Copy-ReferenceNode 'RIFE VFI' 137 @(80.0, 4820.0)
$rtx = Copy-ReferenceNode 'RTXVideoSuperResolution' 138 @(620.0, 4890.0)
$audioGuard = [pscustomobject]@{
    id = 139
    type = 'MiniMaxH3AudioFiniteGuard'
    pos = @(-20.0, 5260.0)
    size = @(290.0, 46.0)
    flags = [pscustomobject]@{}
    order = 23
    mode = 0
    inputs = @([pscustomobject]@{ name = 'audio'; type = 'AUDIO'; link = 257 })
    outputs = @([pscustomobject]@{ name = 'audio'; type = 'AUDIO'; links = @(239) })
    properties = [pscustomobject]@{ 'Node name for S&R' = 'MiniMaxH3AudioFiniteGuard' }
    widgets_values = @()
}

$rife.inputs[0].link = 254
$rife.outputs[0].links = @(255)
$rtx.inputs[0].link = 255
$rtx.outputs[0].links = @(256)
(Get-Node $workflow 121).outputs[0].links = @(257)

$turboLora = Get-Node $workflow 134
$turboLora.outputs[0].links = @(250, 251)
(Get-Node $workflow 122).outputs[0].links = @(254)
(Get-Node $workflow 130).inputs[0].link = 256

$workflow.links = @($workflow.links | Where-Object { $_[0] -ne 238 })
foreach ($link in $workflow.links) {
    if ($link[0] -in 250, 251) { $link[1] = 134 }
    if ($link[0] -eq 239) { $link[1] = 139 }
}
$workflow.links += ,@(254, 122, 0, 137, 0, 'IMAGE')
$workflow.links += ,@(255, 137, 0, 138, 0, 'IMAGE')
$workflow.links += ,@(256, 138, 0, 130, 0, 'IMAGE')
$workflow.links += ,@(257, 121, 0, 139, 0, 'AUDIO')
$workflow.nodes += @($rife, $rtx, $audioGuard)
$workflow.last_node_id = 139
$workflow.last_link_id = 257

$workflow | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $output -Encoding utf8
Write-Output $output

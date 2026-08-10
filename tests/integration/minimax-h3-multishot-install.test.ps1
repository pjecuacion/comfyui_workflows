# Purpose: Validate the imported MiniMax H3 multishot workflow bundle.
# Expected behavior: Upstream JSON parses and local AIO selects installed models.
# Related plan: 2026-08-06 - MiniMax H3 Multishot Workflow Import.
# Preconditions: Pass the active ComfyUI root when it is not the portable default.

param(
    [string]$ComfyRoot = 'C:\ComfyUI_windows_portable\ComfyUI'
)

$bundle = Join-Path $PSScriptRoot '..\..\workflows\minimax-h3-multishot'
$upstream = Join-Path $bundle 'upstream'
$expectedFiles = @(
    'H3_Keyframes.json',
    'H3_Multishot_AIO.json',
    'H3_Multishot_MEMORY.json'
)

foreach ($name in $expectedFiles) {
    $path = Join-Path $upstream $name
    $null = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
}

$localPath = Join-Path $bundle 'H3_Multishot_AIO_local-safetensors.json'
$localWorkflow = Get-Content -LiteralPath $localPath -Raw | ConvertFrom-Json
$modelLoader = $localWorkflow.nodes | Where-Object { $_.type -eq 'H3ModelLoaderAny' }
$clipLoader = $localWorkflow.nodes | Where-Object { $_.type -eq 'H3ClipLoaderAny' }

$modelName = 'minimax_h3_fl2va_pruned_fp8_scaled.safetensors'
$clipName = 'qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors'
if ($modelLoader.widgets_values[0] -ne $modelName) {
    throw 'Local AIO does not select the installed FP8 MiniMax model.'
}
if ($clipLoader.widgets_values[0] -ne $clipName) {
    throw 'Local AIO does not select the installed NVFP4 text encoder.'
}

$modelPath = Join-Path $ComfyRoot "models\diffusion_models\$modelName"
$clipPath = Join-Path $ComfyRoot "models\text_encoders\$clipName"
$nodePack = Join-Path $ComfyRoot 'custom_nodes\ComfyUI-H3-Multishot'
if (-not (Test-Path -LiteralPath $modelPath)) { throw "Missing model: $modelPath" }
if (-not (Test-Path -LiteralPath $clipPath)) { throw "Missing encoder: $clipPath" }
if (-not (Test-Path -LiteralPath $nodePack)) { throw "Missing node pack: $nodePack" }

$registeredSource = Get-Content -LiteralPath (Join-Path $nodePack 'h3_multishot_utils.py') -Raw
foreach ($nodeType in @('H3ModelLoaderAny', 'H3ClipLoaderAny', 'H3MultishotSampler')) {
    if ($registeredSource -notmatch [regex]::Escape($nodeType)) {
        throw "Custom node is not registered in source: $nodeType"
    }
}

Write-Output 'MiniMax H3 multishot installation validation passed.'

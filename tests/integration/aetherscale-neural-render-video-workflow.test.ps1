# Purpose: Validate the shared minimal AetherScale Neural Rendering workflow bundle.
# Expected behavior: Bundle matches its source and preserves the exact isolated video path.
# Related bug or lesson ID: Feature workflow validation.
# Preconditions: Installed AetherScale repository exists at the expected portable-ComfyUI path.

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$bundlePath = Join-Path $repoRoot 'workflows/aetherscale-neural-render-video/aetherscale_neural_render_video.json'
$sourcePath = 'C:\ComfyUI_windows_portable\ComfyUI\custom_nodes\ComfyUI-AetherScale\workflows\aetherscale_neural_render_video.json'
$originalPath = Join-Path $repoRoot 'workflows/aetherscale-video-enhance-2x/aetherscale_video_enhance_2x.json'
$workflow = Get-Content -Raw -LiteralPath $bundlePath | ConvertFrom-Json

function Assert-Equal($actual, $expected, $message) {
    if ($actual -ne $expected) { throw "$message. Expected '$expected', got '$actual'." }
}

$types = @($workflow.nodes | ForEach-Object { $_.type })
Assert-Equal $workflow.nodes.Count 6 'Bundle must remain minimal'
Assert-Equal $workflow.links.Count 7 'Bundle must contain only required links'
foreach ($required in @('VHS_LoadVideo', 'VHS_VideoInfoLoaded', 'AetherScaleMotionAnalysis', 'AetherScaleNeuralRendering', 'VHS_VideoCombine', 'MarkdownNote')) {
    Assert-Equal (@($types | Where-Object { $_ -eq $required }).Count) 1 "Bundle must contain one $required node"
}
foreach ($forbidden in @('AetherScaleRestoration', 'AetherScaleSuperResolution', 'AetherScaleHDR')) {
    Assert-Equal (@($types | Where-Object { $_ -eq $forbidden }).Count) 0 "Bundle must exclude $forbidden"
}

$bundleHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $bundlePath).Hash
$sourceHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $sourcePath).Hash
$originalHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $originalPath).Hash
Assert-Equal $bundleHash $sourceHash 'Bundle must exactly match installed source workflow'
Assert-Equal $originalHash '553DE5B4C8D444FAC2B1B4E8B507F862C26AE680A968CC700DE331D7BE525D85' 'Existing 2x bundle must remain unchanged'

Write-Host 'PASS: Shared minimal AetherScale Neural Rendering workflow is valid.'

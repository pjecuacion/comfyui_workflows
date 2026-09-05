# Purpose: Prevent the face-detail workflow from importing null widget values.
# Expected behavior: DualVideoPreview uses an ordered six-value widget array.
# Related bug or lesson ID: BUG-007.
# Preconditions: Run from the comfyui_workflows repository; PowerShell 7 or later.

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot | Split-Path -Parent
$paths = @(
    (Join-Path $repoRoot 'workflows/aetherscale-face-detail-video/aetherscale_face_detail_video.json'),
    'C:\ComfyUI_windows_portable\ComfyUI\custom_nodes\ComfyUI-AetherScale\workflows\aetherscale_face_detail_video.json'
)

foreach ($path in $paths) {
    $workflow = Get-Content -Raw -LiteralPath $path | ConvertFrom-Json
    $node = @($workflow.nodes | Where-Object { $_.type -eq 'DualVideoPreview' })
    if ($node.Count -ne 1) { throw "$path must contain exactly one DualVideoPreview node." }

    $actual = @($node[0].widgets_values)
    $expected = @('', '', 'Before', 'After', 24, $true)
    if ($actual.Count -ne $expected.Count) {
        throw "$path has the wrong number of DualVideoPreview widgets: $($actual.Count)"
    }
    for ($i = 0; $i -lt $expected.Count; $i++) {
        if ($actual[$i] -ne $expected[$i]) {
            throw "$path has invalid DualVideoPreview widget serialization: $($actual | ConvertTo-Json -Compress)"
        }
    }

    $detailer = @($workflow.nodes | Where-Object { $_.type -eq 'DetailerForEachPipeForAnimateDiff' })
    if ($detailer.Count -ne 1) { throw "$path must contain exactly one video detailer node." }
    $detailerExpected = @(512, $true, 768, 123456789, 6, 8.0, 'euler', 'normal', 0.3, 8, 0.0, 20)
    $detailerActual = @($detailer[0].widgets_values)
    if ($detailerActual.Count -ne $detailerExpected.Count) {
        throw "$path has the wrong number of video detailer widgets: $($detailerActual.Count)"
    }
    for ($i = 0; $i -lt $detailerExpected.Count; $i++) {
        if ($detailerActual[$i] -ne $detailerExpected[$i]) {
            throw "$path has invalid video detailer widget serialization: $($detailerActual | ConvertTo-Json -Compress)"
        }
    }
}

Write-Host 'PASS: face-detail compare widgets use frontend-compatible ordered serialization.'

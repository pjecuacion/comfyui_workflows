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
    if (($actual | ConvertTo-Json -Compress) -ne ($expected | ConvertTo-Json -Compress)) {
        throw "$path has invalid DualVideoPreview widget serialization: $($actual | ConvertTo-Json -Compress)"
    }
}

Write-Host 'PASS: face-detail compare widgets use frontend-compatible ordered serialization.'

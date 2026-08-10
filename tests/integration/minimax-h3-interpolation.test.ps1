# Purpose: Validate the MiniMax H3 RTX-upscaled interpolation workflow graph.
# Expected behavior: RIFE doubles frames and final FPS while preserving audio.
# Related plan: 2026-08-05 - MiniMax H3 Duration-Safe Frame Interpolation.
# Preconditions: Run from the repository root with PowerShell 7 or Windows PowerShell.

$workflowPath = Join-Path $PSScriptRoot '..\..\workflows\minimaxh3-fp8\video_minimax_h3_t2v fp8 sageattention rtx upscaled interpolated.json'
$workflow = Get-Content -LiteralPath $workflowPath -Raw | ConvertFrom-Json
$upscaler = $workflow.definitions.subgraphs |
    Where-Object { $_.name -eq 'RTX Video Upscaler' }

if (-not $upscaler) {
    throw 'RTX Video Upscaler subgraph is missing.'
}

$rife = $upscaler.nodes | Where-Object { $_.type -eq 'RIFE VFI' }
$rtxUpscaler = $upscaler.nodes | Where-Object { $_.type -eq 'RTXVideoSuperResolution' }
$createVideo = $upscaler.nodes | Where-Object { $_.type -eq 'CreateVideo' }

if ($rife.widgets_values[2] -ne 2) {
    throw 'RIFE multiplier must be 2.'
}
if ($rife.inputs[0].link -ne 250) {
    throw 'RIFE must receive native-resolution frames before RTX upscaling.'
}
if ($rtxUpscaler.inputs[0].link -ne 257) {
    throw 'RTX upscaling must receive interpolated frames.'
}
if ($createVideo.inputs[0].link -ne 258) {
    throw 'Final video must receive upscaled, interpolated frames.'
}
if ($createVideo.inputs[1].link -ne 252) {
    throw 'Original generated audio must remain connected.'
}
if ($null -ne $createVideo.inputs[2].link -or $createVideo.widgets_values[0] -ne 48) {
    throw 'Final video must encode at an explicit 48 FPS.'
}

$linkIds = @($workflow.links | ForEach-Object { $_[0] })
foreach ($subgraph in $workflow.definitions.subgraphs) {
    $linkIds += @($subgraph.links | ForEach-Object { $_.id })
}
if (($linkIds | Sort-Object -Unique).Count -ne $linkIds.Count) {
    throw 'Workflow link IDs must be globally unique.'
}

Write-Output 'MiniMax H3 interpolation workflow validation passed.'

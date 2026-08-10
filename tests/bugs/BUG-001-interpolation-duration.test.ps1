# Purpose: Prevent 2x interpolation from doubling the MiniMax clip duration.
# Expected behavior: 294 source frames become 587 frames encoded at 48 FPS.
# Related bug: BUG-001.
# Preconditions: Run from the repository root with PowerShell.

$workflowPath = Join-Path $PSScriptRoot '..\..\workflows\minimaxh3-fp8\video_minimax_h3_t2v fp8 sageattention rtx upscaled interpolated.json'
$workflow = Get-Content -LiteralPath $workflowPath -Raw | ConvertFrom-Json
$subgraph = $workflow.definitions.subgraphs |
    Where-Object { $_.name -eq 'RTX Video Upscaler' }
$rife = $subgraph.nodes | Where-Object { $_.type -eq 'RIFE VFI' }
$createVideo = $subgraph.nodes | Where-Object { $_.type -eq 'CreateVideo' }

$sourceFrames = 294
$sourceFps = 24
$multiplier = [int]$rife.widgets_values[2]
$outputFps = [double]$createVideo.widgets_values[0]
$outputFrames = (($sourceFrames - 1) * $multiplier) + 1
$sourceDuration = ($sourceFrames - 1) / $sourceFps
$outputDuration = ($outputFrames - 1) / $outputFps

if ($createVideo.inputs[2].link -ne $null) {
    throw 'Output FPS must not depend on a malformed expression link.'
}
if ([math]::Abs($sourceDuration - $outputDuration) -gt 0.000001) {
    throw "Interpolation changed duration from $sourceDuration to $outputDuration seconds."
}

Write-Output 'BUG-001 duration regression validation passed.'

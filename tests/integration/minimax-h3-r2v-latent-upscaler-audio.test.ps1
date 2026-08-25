# Purpose: Preserve first-pass H3 reference-conditioned audio through latent-upscaled video refinement.
# Expected behavior: Final video uses second-pass images and first-pass generated audio.
# Related workflow: MiniMax H3 R2V latent upscaler, voice-reference-audio-preserved variant.
# Preconditions: Run from the repository root in PowerShell.

$ErrorActionPreference = 'Stop'
$workflowPath = Join-Path $PSScriptRoot '..\..\workflows\minimax-h3-latent-upscaler\minimax_h3_r2v_latent_upscaler_voice_reference_audio_preserved.json'
$workflow = Get-Content -LiteralPath $workflowPath -Raw | ConvertFrom-Json

function Get-Node([int]$id) {
    $node = $workflow.nodes | Where-Object id -eq $id
    if (-not $node) { throw "Missing node $id." }
    return $node
}

$firstAudio = Get-Node 8
$secondAudio = Get-Node 14
$secondImages = Get-Node 25
$createVideo = Get-Node 34

if ($createVideo.inputs[0].link -ne 41 -or @($secondImages.outputs[0].links) -notcontains 41) {
    throw 'Final video must retain second-pass latent-upscaled images.'
}
if ($createVideo.inputs[1].link -ne 53 -or @($firstAudio.outputs[0].links) -notcontains 53) {
    throw 'Final video must use first-pass reference-conditioned generated audio.'
}
if ($secondAudio.outputs[0].links) {
    throw 'Second-pass decoded audio must not replace the first-pass voice-reference result.'
}

$linkIds = @($workflow.links | ForEach-Object { $_[0] })
if (($linkIds | Sort-Object -Unique).Count -ne $linkIds.Count) {
    throw 'Workflow link IDs must be unique.'
}

Write-Output 'MiniMax H3 R2V latent-upscaler audio-preservation validation passed.'

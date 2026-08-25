# Purpose: Keep a MiniMax H3 voice reference separate from generated output audio.
# Expected behavior: The selected clip conditions voice timbre only; H3-generated audio is exported.
# Related lesson: LESSON-007.
# Preconditions: Run from the repository root in PowerShell.

$ErrorActionPreference = 'Stop'
$workflowPath = Join-Path $PSScriptRoot '..\..\workflows\minimax-h3-latent-upscaler\minimax_h3_r2v_latent_upscaler_voice_reference_audio.json'
$workflow = Get-Content -LiteralPath $workflowPath -Raw | ConvertFrom-Json

function Get-Node([int]$id) {
    $node = $workflow.nodes | Where-Object id -eq $id
    if (-not $node) { throw "Missing node $id." }
    return $node
}

$loadAudio = Get-Node 39
$reference = Get-Node 11
$decodedAudio = Get-Node 14
$createVideo = Get-Node 34
$prompt = (Get-Node 2).widgets_values[0]

if ($reference.inputs[8].link -ne 51 -or @($loadAudio.outputs[0].links) -ne 51) {
    throw 'LoadAudio must only feed MiniMax H3 ref_audio_0.'
}
if ($createVideo.inputs[1].link -ne 42 -or @($decodedAudio.outputs[0].links) -ne 42) {
    throw 'CreateVideo must export H3-generated audio.'
}
if ($workflow.nodes | Where-Object type -eq 'MiniMaxH3AddGuide') {
    throw 'Voice-reference audio must not be converted into an exact timing guide.'
}
if ($prompt -notmatch 'voice-timbre and delivery reference' -or $prompt -notmatch 'Do not reuse') {
    throw 'Prompt must identify Audio 1 as a timbre-only reference.'
}

Write-Output 'LESSON-007 MiniMax H3 voice-reference workflow validation passed.'

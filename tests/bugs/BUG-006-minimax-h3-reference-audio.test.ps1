# Purpose: Ensure the H3 latent-upscaler workflow uses supplied reference audio for timing and export.
# Expected behavior: Audio 1 guides H3 from frame zero and is the final MP4 soundtrack.
# Related bug: BUG-006.
# Preconditions: Run from the repository root in PowerShell.

$ErrorActionPreference = 'Stop'
$workflowPath = Join-Path $PSScriptRoot '..\..\workflows\minimax-h3-latent-upscaler\minimax_h3_r2v_latent_upscaler_exact_ref_audio.json'
$workflow = Get-Content -LiteralPath $workflowPath -Raw | ConvertFrom-Json

function Get-Node([int]$id) {
    $node = $workflow.nodes | Where-Object id -eq $id
    if (-not $node) { throw "Missing node $id." }
    return $node
}

function Get-Link([int]$id) {
    $link = $workflow.links | Where-Object { $_[0] -eq $id }
    if (-not $link) { throw "Missing link $id." }
    return $link
}

$loadAudio = Get-Node 39
$reference = Get-Node 11
$guide = Get-Node 41
$createVideo = Get-Node 34
$decodedAudio = Get-Node 14

if ($reference.inputs[8].link -ne 51) {
    throw 'LoadAudio must feed MiniMax H3 ref_audio_0.'
}
if ($guide.type -ne 'MiniMaxH3AddGuide' -or $guide.inputs[5].link -ne 56) {
    throw 'Audio 1 must anchor H3 timing through MiniMaxH3AddGuide.'
}
if ($guide.widgets_values[0] -ne 0) {
    throw 'The audio guide must be anchored at its default frame 0.'
}
if ($createVideo.inputs[1].link -ne 59) {
    throw 'CreateVideo must receive the supplied LoadAudio track, not decoded generated audio.'
}
if ($decodedAudio.outputs[0].links) {
    throw 'Decoded generated audio must not replace the supplied output soundtrack.'
}
if (@($loadAudio.outputs[0].links) -notcontains 51 -or @($loadAudio.outputs[0].links) -notcontains 56 -or @($loadAudio.outputs[0].links) -notcontains 59) {
    throw 'LoadAudio must feed reference conditioning, timing guidance, and final export.'
}

foreach ($id in 53..59) { [void](Get-Link $id) }
Write-Output 'BUG-006 MiniMax H3 reference-audio workflow validation passed.'

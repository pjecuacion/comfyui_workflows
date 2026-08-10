# Purpose: Validate the local MiniMax H3 Multishot Turbo AIO workflow.
# Expected behavior: Turbo LoRA feeds a four-step dual-AV multishot sampler.
# Related task: 2026-08-06 MiniMax H3 Multishot Turbo AIO.
# Preconditions: Portable ComfyUI and both custom-node packs are installed.

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$workflowPath = Join-Path $root 'workflows\minimax-h3-multishot-turbo\H3_Multishot_Turbo_AIO_local-safetensors.json'
$standardPath = Join-Path $root 'workflows\minimax-h3-multishot\H3_Multishot_AIO_local-safetensors.json'
$nodePath = 'C:\ComfyUI_windows_portable\ComfyUI\custom_nodes\ComfyUI-H3-Multishot\h3_multishot_utils.py'
$workflow = Get-Content -Raw -LiteralPath $workflowPath | ConvertFrom-Json
$standard = Get-Content -Raw -LiteralPath $standardPath | ConvertFrom-Json

function Require($condition, $message) {
    if (-not $condition) { throw $message }
}

$loader = $workflow.nodes | Where-Object id -eq 1
$turbo = $workflow.nodes | Where-Object type -eq 'MiniMaxH3TurboLoRA'
$sampler = $workflow.nodes | Where-Object type -eq 'H3MultishotSampler'
$video = $workflow.nodes | Where-Object type -eq 'CreateVideo'

Require ($loader.widgets_values[0] -eq 'minimax_h3_fl2va_pruned_int8_convrot.safetensors') 'Wrong local base model.'
Require ($turbo.widgets_values[0] -eq 'minimax_h3_turbo_4step_ckpt500.safetensors') 'Wrong Turbo LoRA.'
Require ($sampler.widgets_values[1] -eq 2) 'Smoke test must render exactly two shots.'
Require ($sampler.widgets_values[4] -eq 73) 'Smoke test must use 73 frames per shot.'
Require ($sampler.widgets_values[6] -eq 'randomize') 'Seed control-after-generate must remain randomize.'
Require ($sampler.widgets_values[7] -eq 4) 'Displayed step count must be four.'
Require ($sampler.widgets_values[-1] -eq $true) 'Turbo mode must be enabled.'
Require ($video.widgets_values[0] -eq 24) 'Native output must remain 24 FPS.'
Require (@($workflow.nodes | Where-Object type -in @('RIFE VFI','RTXVideoSuperResolution')).Count -eq 0) 'Smoke test must not post-process video.'
Require (@($workflow.links | Where-Object { $_[1] -eq 1 -and $_[3] -eq $turbo.id }).Count -eq 1) 'Base model must feed Turbo LoRA.'
Require (@($workflow.links | Where-Object { $_[1] -eq $turbo.id -and $_[3] -eq $sampler.id }).Count -eq 1) 'Turbo LoRA must feed Multishot.'
Require (@($standard.nodes | Where-Object type -eq 'MiniMaxH3TurboLoRA').Count -eq 0) 'Standard workflow was modified.'

$source = Get-Content -Raw -LiteralPath $nodePath
Require ($source.Contains('effective_steps = 4 if turbo_mode else steps')) 'Installed Multishot node does not force four Turbo steps.'
Require ($source.Contains('MiniMaxH3TurboSampler')) 'Installed Multishot node does not resolve the Turbo sampler.'

Write-Output 'PASS: MiniMax H3 Multishot Turbo graph and installed sampler extension are valid.'

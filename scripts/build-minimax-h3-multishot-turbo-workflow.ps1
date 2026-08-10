$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$source = Join-Path $root 'workflows\minimax-h3-multishot\H3_Multishot_AIO_local-safetensors.json'
$targetDir = Join-Path $root 'workflows\minimax-h3-multishot-turbo'
$target = Join-Path $targetDir 'H3_Multishot_Turbo_AIO_local-safetensors.json'
$workflow = Get-Content -Raw -LiteralPath $source | ConvertFrom-Json

$loader = $workflow.nodes | Where-Object id -eq 1
$sampler = $workflow.nodes | Where-Object id -eq 5
$save = $workflow.nodes | Where-Object id -eq 7
$note = $workflow.nodes | Where-Object id -eq 8

$loader.widgets_values[0] = 'minimax_h3_fl2va_pruned_int8_convrot.safetensors'
$loader.outputs[0].links = @(18)
$sampler.inputs[0].link = 19
$sampler.widgets_values[0] = @'
Shot 1: A cinematic medium shot of the same presenter in a bright studio. She looks into the camera and says, "This is the first Turbo multishot test." Clean synchronized speech and quiet room tone.
---
Shot 2: Continue from the previous frame with the same presenter, clothes, lighting, and studio. She smiles and says, "And this is shot two, generated in four steps." Clean synchronized speech and quiet room tone.
'@
$sampler.widgets_values[1] = 2
$sampler.widgets_values[4] = 73
$sampler.widgets_values[7] = 4
$sampler.inputs += @(
    [pscustomobject]@{ name='sampler_name'; type='COMBO'; widget=[pscustomobject]@{ name='sampler_name' }; link=$null },
    [pscustomobject]@{ name='scheduler'; type='COMBO'; widget=[pscustomobject]@{ name='scheduler' }; link=$null },
    [pscustomobject]@{ name='turbo_mode'; type='BOOLEAN'; widget=[pscustomobject]@{ name='turbo_mode' }; link=$null }
)
$sampler.widgets_values += @('res_multistep', 'simple', $true)
$save.widgets_values[0] = 'video/H3MULTI_TURBO/MASTER_NATIVE_24FPS'
$note.widgets_values[0] = @'
## H3 Multishot Turbo AIO - two-shot smoke test

Uses the local pruned INT8 H3 base plus the 4-step Turbo LoRA and Turbo's separate video/audio flow schedule. Prompts are separated by `---`. Shot 2 begins from shot 1's final frame.

Start with this native 24 FPS workflow. It intentionally has no RIFE or RTX upscale so generation and audio can be verified before adding post-processing.
'@

$turbo = [pscustomobject]@{
    id = 18
    type = 'MiniMaxH3TurboLoRA'
    pos = @(-465.0, 26.0)
    size = @(270.0, 82.0)
    flags = [pscustomobject]@{}
    order = 8
    mode = 0
    inputs = @([pscustomobject]@{ name='model'; type='MODEL'; link=18 })
    outputs = @([pscustomobject]@{ name='MODEL'; type='MODEL'; links=@(19) })
    properties = [pscustomobject]@{ 'Node name for S&R'='MiniMaxH3TurboLoRA' }
    widgets_values = @('minimax_h3_turbo_4step_ckpt500.safetensors', 1.0)
}
$workflow.nodes += $turbo
$workflow.links = @($workflow.links | Where-Object { $_[0] -ne 1 })
$workflow.links += ,@(18, 1, 0, 18, 0, 'MODEL')
$workflow.links += ,@(19, 18, 0, 5, 0, 'MODEL')
$workflow.last_node_id = 18
$workflow.last_link_id = 19

foreach ($node in $workflow.nodes) {
    if ($node.id -eq 5) { $node.order = 9 }
    elseif ($node.order -ge 8 -and $node.id -ne 18) { $node.order++ }
}

New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
$workflow | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $target -Encoding utf8
Write-Output $target

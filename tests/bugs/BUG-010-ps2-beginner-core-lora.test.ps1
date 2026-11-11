# Purpose: The PS2 beginner workflow must load on RunningHub, whose Power Lora Loader differs from rgthree's.
# Expected behavior: no rgthree node anywhere; the PS2 LoRA sits in a core LoraLoaderModelOnly right after
#   Load Diffusion Model (node 127), at strength 1.0, and its MODEL output feeds BOTH old targets (turbo LoRA 134
#   and the switch 135), so the LoRA works with turbo on or off.
# Related bug: BUG-010.
# Preconditions: Run from any folder with PowerShell 7.

$root = Join-Path $PSScriptRoot '..\..'
$wfPath = Join-Path $root 'workflows\beginner-h3-modern-ps2-lora\minimax_h3_modern_ps2_lora_beginner.json'
$raw = Get-Content -LiteralPath $wfPath -Raw
if ($raw -match 'rgthree|Power Lora Loader') { throw 'Beginner workflow must not need rgthree (breaks on RunningHub).' }
$wf = $raw | ConvertFrom-Json -AsHashtable
$sg = $wf.definitions.subgraphs[0]
$ps2 = @($sg.nodes | Where-Object { $_.type -eq 'LoraLoaderModelOnly' -and $_.widgets_values[0] -match 'ps2' })
if ($ps2.Count -ne 1) { throw "Expected one PS2 Load LoRA node, found $($ps2.Count)." }
$n = $ps2[0]
if ($n.widgets_values[1] -ne 1) { throw 'PS2 LoRA strength must be 1.0.' }
$inLink = $sg.links | Where-Object { $_.id -eq $n.inputs[0].link }
if ($inLink.origin_id -ne 127) { throw 'PS2 LoRA must take MODEL straight from Load Diffusion Model (127).' }
$targets = @($sg.links | Where-Object { $_.origin_id -eq $n.id } | ForEach-Object { $_.target_id } | Sort-Object)
if (($targets -join ',') -ne '134,135') { throw "PS2 LoRA MODEL must feed 134 and 135, got $($targets -join ',')." }
Write-Output 'BUG-010 PS2 beginner core LoRA validation passed.'

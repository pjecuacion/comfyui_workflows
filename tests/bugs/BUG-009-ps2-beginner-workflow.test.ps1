# Purpose: The PS2 beginner workflow must reproduce the video's setup, not a placeholder template.
# Expected behavior: real PS2 LoRA row at 1.0, prompt starts with the trigger, 4:3 at 0.6 MP, seed 20261117,
#   no "set-lora-by-recipe" placeholder; the old Tests README points to the beginner bundle.
# Related bug: BUG-009.
# Preconditions: Run from any folder with PowerShell 7.

$root = Join-Path $PSScriptRoot '..\..'
$wfPath = Join-Path $root 'workflows\beginner-h3-modern-ps2-lora\minimax_h3_modern_ps2_lora_beginner.json'
$raw = Get-Content -LiteralPath $wfPath -Raw
if ($raw -match 'set-lora-by-recipe') { throw 'Placeholder LoRA name is still in the beginner workflow.' }
$wf = $raw | ConvertFrom-Json -AsHashtable

$outer = $wf.nodes | Where-Object { $_.id -eq 140 }
if (-not $outer.widgets_values[0].StartsWith('modern ps2 style,')) { throw 'Prompt must start with the trigger words.' }
if ($outer.widgets_values[4] -ne 20261117) { throw 'Seed must be 20261117.' }
$res = $wf.nodes | Where-Object { $_.id -eq 115 }
if ($res.widgets_values[0] -ne '4:3 (Standard)' -or $res.widgets_values[1] -ne 0.6) { throw 'Size must be 4:3 at 0.6 MP.' }

$loader = $wf.definitions.subgraphs.nodes | Where-Object { $_.type -eq 'Power Lora Loader (rgthree)' }
$rows = @($loader.widgets_values | Where-Object { $_ -is [hashtable] -and $_.ContainsKey('lora') })
if ($rows.Count -ne 1) { throw "Expected one LoRA row, found $($rows.Count)." }
if ($rows[0].lora -notmatch 'ps2' -or -not $rows[0].on -or $rows[0].strength -ne 1) { throw 'PS2 row must be on at 1.0.' }

$oldReadme = Get-Content -LiteralPath (Join-Path $root 'workflows\tests-h3-modern-ps2-lora\README.md') -Raw
if ($oldReadme -notmatch 'beginner-h3-modern-ps2-lora') { throw 'Old PS2 README must point to the beginner bundle.' }

Write-Output 'BUG-009 PS2 beginner workflow validation passed.'

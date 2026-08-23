$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$workflowRoot = Join-Path $root 'workflows'
$marker = '## Frame Count and Shot Duration'
$note = @'

## Frame Count and Shot Duration

MiniMax generates at 24 FPS. Its valid frame counts follow `17k + 5`, where `k` is any whole number. You do not need to calculate it; use one of these values:

| Frames | Approx. duration |
|---:|---:|
| 73 | 3.04 seconds |
| 124 | 5.17 seconds |
| 243 | 10.13 seconds |
| 362 | 15.08 seconds (approx. trained maximum) |

For Multishot, this duration applies to each shot. Example: two 243-frame shots produce about 20.2 seconds after the duplicated seam frame is removed.
'@

$files = Get-ChildItem -Path $workflowRoot -Recurse -Filter '*.json' |
    Where-Object { $_.FullName -match 'minimax' -and $_.FullName -notmatch '\\upstream\\' }

foreach ($file in $files) {
    $workflow = Get-Content -Raw -LiteralPath $file.FullName | ConvertFrom-Json
    $existing = @($workflow.nodes | Where-Object {
        $_.type -eq 'MarkdownNote' -and $_.widgets_values[0].Contains($marker)
    })
    if ($existing.Count -eq 1) {
        Write-Output $file.FullName
        continue
    }
    if ($existing.Count -gt 1) { throw "Multiple frame-count notes found: $($file.FullName)" }
    $target = $workflow.nodes | Where-Object {
        $_.type -eq 'MarkdownNote' -and $_.title -eq 'Note: Size Settings Reference'
    } | Select-Object -First 1
    if ($null -eq $target) { throw "Size-reference note not found: $($file.FullName)" }
    if (-not $target.widgets_values[0].Contains($marker)) {
        $target.widgets_values[0] += $note
        $workflow | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $file.FullName -Encoding utf8
    }
    Write-Output $file.FullName
}

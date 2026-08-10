# Purpose: Validate the shared MiniMax frame-count explanation.
# Expected behavior: Every custom MiniMax workflow has one note; upstream stays unchanged.
# Related task: 2026-08-06 MiniMax Frame Count Notes.
# Preconditions: Workflow JSON files exist under workflows/.

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$marker = '## Frame Count and Shot Duration'
$files = Get-ChildItem (Join-Path $root 'workflows') -Recurse -Filter '*.json' |
    Where-Object { $_.FullName -match 'minimax' }
$custom = @($files | Where-Object { $_.FullName -notmatch '\\upstream\\' })
$upstream = @($files | Where-Object { $_.FullName -match '\\upstream\\' })

if ($custom.Count -ne 6) { throw "Expected 6 custom MiniMax workflows; found $($custom.Count)." }
foreach ($file in $custom) {
    $workflow = Get-Content -Raw -LiteralPath $file.FullName | ConvertFrom-Json
    $matches = @($workflow.nodes | Where-Object {
        $_.type -eq 'MarkdownNote' -and $_.widgets_values[0].Contains($marker)
    })
    if ($matches.Count -ne 1) { throw "$($file.Name) has $($matches.Count) frame notes." }
}
foreach ($file in $upstream) {
    if ((Get-Content -Raw -LiteralPath $file.FullName).Contains($marker)) {
        throw "Upstream reference was modified: $($file.FullName)"
    }
}
Write-Output 'PASS: all six custom MiniMax workflows contain the shared frame note.'

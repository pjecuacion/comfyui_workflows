# Purpose: Prevent the workflow README table from rendering as a malformed row.
# Expected behavior: The header, separator, and every workflow row have three cells.
# Related bug: BUG-005; lesson LESSON-006.
# Preconditions: Run from the repository root with PowerShell.

$readmePath = Join-Path $PSScriptRoot '..\..\docs\README.md'
$lines = Get-Content -LiteralPath $readmePath
$tableStart = [array]::IndexOf($lines, '| Bundle | Workflow | What it is |')

if ($tableStart -lt 0) {
    throw 'Workflow table header was not found.'
}

function Get-TableCellCount([string]$line) {
    return (($line.Trim().Trim('|').Split('|')).Count)
}

$expectedCells = 3
for ($index = $tableStart; $index -lt $lines.Count; $index++) {
    $line = $lines[$index]
    if (-not $line.Trim().StartsWith('|')) { break }
    if ((Get-TableCellCount $line) -ne $expectedCells) {
        throw "Malformed README table row at line $($index + 1): $line"
    }
}

Write-Output 'BUG-005 README table regression validation passed.'

# Purpose: Keep workflow paths short enough for common Windows clone locations.
# Expected behavior: Tracked paths fit the limit and all Taomate profiles are valid and indexed.
# Related bug: BUG-008; GitHub issue #1.
# Preconditions: Run from a Git checkout with PowerShell 7 or Windows PowerShell.

$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$paths = @(git -C $repo ls-files)
if ($LASTEXITCODE -ne 0) { throw 'Unable to list tracked files.' }

# Leaves room for a 100-character checkout directory under the 260-character
# legacy Windows path limit, including a separator and the terminating NUL.
$maxRelativeLength = 140
$tooLong = @($paths | Where-Object { $_.Length -gt $maxRelativeLength })
if ($tooLong.Count -gt 0) {
    throw "Tracked paths exceed $maxRelativeLength characters: $($tooLong -join ', ')"
}

$catalogs = @('docs/README.md', 'docs/workflows.md')
foreach ($style in @('anime', 'realism')) {
    $folder = "workflows/minimax-h3-taomate_3sstep/$style example"
    $files = @('scene_01_3steps_1mp_base.json')
    $files += 2..5 | ForEach-Object { "scene_01_3steps_1mp_profile_$_.json" }
    $actual = @($paths | Where-Object { $_ -like "$folder/*.json" })
    if ($actual.Count -ne $files.Count) { throw "Expected five $style workflow files." }

    foreach ($file in $files) {
        $path = "$folder/$file"
        if ($path -notin $actual) { throw "Missing Taomate profile: $path" }
        $fullPath = Join-Path $repo ($path.Replace('/', '\'))
        $null = Get-Content -LiteralPath $fullPath -Raw | ConvertFrom-Json
        foreach ($catalog in $catalogs) {
            $content = Get-Content -LiteralPath (Join-Path $repo $catalog) -Raw
            if (-not $content.Contains($path)) { throw "$catalog does not list $path" }
        }
    }
}

Write-Output 'BUG-008 Windows clone path-length validation passed.'

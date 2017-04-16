function Get-Executable {
    param(
        [string] $baseDir, [string] $regEx
    )

    if (!$fileName -and !$regEx) {
        Write-Verbose 'Get-Executable: No file name or regular expression provided. Aborting...'
        return
    }

    $searchDir = Get-BaseDirectory $baseDir
    $files = Get-ChildItem -Path $searchDir -Recurse | Where-Object { $_.Name -match $regEx }

    Write-Host "Get-Executable: Found $($files.Count) file(s) matching $regEx in $baseDir"

    # Always use the first file found
    if ($files.Count -gt 0) {
        Write-Verbose "Get-Executable: Executable is '$($files[0].FullName)'"

        return $files[0].FullName
    }
    elseif (!$files) {
        return
    }
}
function Install-FromWeb {
    param([PSCustomObject] $arguments)

    if ($arguments.url) {
        Write-Verbose "Get-InstallerFromWeb: Downloading from '$($arguments.url)'"

        # Download the file
        $arguments.file = Get-ChocolateyWebFile @arguments

        # Install the file
        Install-ChocolateyInstallPackage @arguments
    }
}
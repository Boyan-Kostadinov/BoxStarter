param([switch] $force)

$packageDir = $PSScriptRoot

. (Join-Path $PSScriptRoot '..\Scripts\update.begin.ps1')

function global:au_GetLatest {
    $releaseUrl = 'https://dotnet.microsoft.com/download'
    $versionRegEx = 'Runtime.*?([0-9\.]+)'
    $downloadLinkRegEx = 'dotnet-runtime-$version-windows-hosting-bundle-installer'
    $thankYouPageUrl = 'https://www.microsoft.com/net/download/thank-you/$downloadLinkRegEx'

    $releasePage = Invoke-WebRequest -UseBasicParsing -Uri $releaseUrl
    $version = [regex]::match($releasePage.Content, $versionRegEx).Groups[1].Value

    $downloadLinkRegEx = $ExecutionContext.InvokeCommand.ExpandString($downloadLinkRegEx)
    $thankYouPageUrl = $ExecutionContext.InvokeCommand.ExpandString($thankYouPageUrl)

    $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $thankYouPageUrl
    $url = $downloadPage.Links | Where-Object outerHTML -match '\.exe' | Select-Object -First 1 -Expand href

    if ($force) {
        $global:au_Version = $version
    }

    return @{ Url32 = $url; Version = $version }
}

. (Join-Path $PSScriptRoot '..\Scripts\update.end.ps1')
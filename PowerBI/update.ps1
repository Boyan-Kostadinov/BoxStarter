. (Join-Path $PSScriptRoot '..\Build\update.common.ps1')

function global:au_GetLatest {
    $releaseUrl = 'https://www.microsoft.com/en-us/download/details.aspx?id=45331'
    $downloadUrl = 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=45331'
    $versionRegEx = 'Version:.*?([0-9\.]+)'
    $installerRegEx = 'PBIDesktop_x64.msi'

    $releasePage = Invoke-WebRequest -Uri $releaseUrl -UseBasicParsing
    $version = $releasePage.Content -match $versionRegEx
    $version = $matches[1]

    $downloadPage = Invoke-WebRequest -Uri $downloadUrl -UseBasicParsing
    $url = $downloadPage.Links | Where-Object href -match $installerRegEx | Select-Object -First 1 -Expand href

    return @{ Url32 = $url; Version = $version }
}

Update-Package -ChecksumFor none -NoCheckChocoVersion
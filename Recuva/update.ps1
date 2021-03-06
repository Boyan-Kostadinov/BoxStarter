﻿param([switch] $force)

$packageDir = $PSScriptRoot

. (Join-Path $PSScriptRoot '..\Scripts\update.begin.ps1')

function global:au_GetLatest {
    $relasePageUrl = 'https://www.piriform.com/recuva/version-history'
    $downloadPageUrl = 'https://www.piriform.com/recuva/download/standard'
    $executableRegEx = '\.exe$'
    $versionRegEx = '\<h6\>v((?:[\d]\.)[\d\.]+)'

    $releasePage = Invoke-WebRequest $relasePageUrl -UseBasicParsing
    $version = ([regex]::match($releasePage.Content, $versionRegEx).Groups[1].Value)

    $downloadPage = Invoke-WebRequest -Uri $downloadPageUrl -UseBasicParsing
    $url = $downloadPage.links | Where-Object href -match $executableRegEx | Select-Object -First 1 -expand href

    if ($force) {
        $global:au_Version = $version
    }

    return @{ Url32 = $url; Version = $version }
}

. (Join-Path $PSScriptRoot '..\Scripts\update.end.ps1')
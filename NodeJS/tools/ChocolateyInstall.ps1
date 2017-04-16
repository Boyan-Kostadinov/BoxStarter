﻿$arguments      = @{
    file        = 'node-v7.9.0-x64.msi'
    $url        = 'https://nodejs.org/dist/v7.9.0/node-v7.9.0-x64.msi'
    $checksum   = '9722D751E9D5DD54E2F4384D4259486971B3F073F6CABD32066668D6ABEF4B17'
    silentArgs  = '/quiet'
}

Install-CustomPackage $arguments

$env:Path = "$($env:Path);$(Get-ProgramFilesDirectory)\NodeJS"

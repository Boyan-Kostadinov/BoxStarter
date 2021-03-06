$source = Join-Path $PSScriptRoot '..\..\BoxStarter' -Resolve
$sourceUrl = 'http://nuget.gocontec.com/nuget/Contec/'

$packages = @(
    '7Zip'
    'BoxStarter'
    'BoxStarter.Bootstrapper'
    'BoxStarter.Chocolatey'
    'BoxStarter.Common'
    'BoxStarter.HyperV'
    'BoxStarter.WinConfig'
    'CCleaner'
    'CCleaner-Personal'
    'Chocolatey'
    'Chocolatey.extension'
    'Chocolatey-Core.extension'
    'Chocolatey-Personal'
    'Chocolatey-SQL.extension'
    'ConEmu'
    'ConEmu-Personal'
    'Git'
    'GitExtensions'
    'GitExtensions-Personal'
    'Google-Chrome'
    'Google-Chrome-Personal'
    'KDiff3'
    'LogFusion'
    'LogFusion-Personal'
    'Microsoft-BuildTools'
    'Microsoft-DotNET3.5'
    'Microsoft-DotNET4.5.2'
    'Microsoft-DotNET4.6.2'
    'Microsoft-DotNET4.6.2-DevPack'
    'Microsoft-DotNETCore-Runtime'
    'Microsoft-DotNETCore-SDK'
    'Microsoft-MSBuild'
    'Microsoft-PowerBI'
    #'Microsoft-SQLServer2016Developer'
    'Microsoft-SQLServer2016Express'
    'Microsoft-SQLServer2016LocalDb'
    'Microsoft-SQLServer2016SharedManagementObjects'
    'Microsoft-SQLServerJDBCDriver'
    'Microsoft-SQLServerManagementStudio'
    'Microsoft-VisualCRedistributable2013'
    'Microsoft-VisualCRedistributable2015'
    'Microsoft-VisualStudioCode'
    'Microsoft-VisualStudioCode-Personal'
    'NodeJS'
    'NodeJS-Personal'
    'NuGet-CommandLine'
    'Octopus-Deploy'
    'Octopus-Deploy-CommandLine'
    'Octopus-Deploy-Tentacle'
    'PowerShell'
    'PowerShell-Carbon'
    'PowerShell-CommunityExtensions'
    'PowerShell-Profile'
    'PowerShell-PSake'
    'ProGet'
    'ProGet-Personal'
    'WinDirStat'
    'Windows-IIS'
    'Windows-IIS-ExternalCache'
    'Windows-IIS-Personal'
    'Windows-IIS-UrlRewrite'
    'XYPlorer'
    'XYPlorer-Personal'
)

$packages | % {
    $packageName = $_
    $packageFile = Get-ChildItem $source | Where-Object { $_.BaseName -match "^$packageName\.([0-9\.]+)"}
    $packageVersion = $packageFile.BaseName -replace "^$packageName\.([0-9\.]+)", '$1'

    if (-not (choco list $packageName --version $packageVersion -s $sourceUrl -r)) {
        Write-Host "Pushing $packageName v$packageVersion..."
        Push-ToContec $packageFile.FullName
    }
}
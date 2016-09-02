# The command to run, built from the raw link of this gist
# start http://bit.ly/win10boxstarter

# Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Enable empty checksums for Chocolatey
choco feature enable -n allowEmptyChecksums

########################################
# Boxstarter options
########################################
# Allow reboots
$Boxstarter.RebootOk = $true

# Is this a machine with no login password?
$Boxstarter.NoPassword = $false

# Save password securely and auto-login after a reboot
$Boxstarter.AutoLogin = $true
########################################

########################################
# Window Configuration. See http://boxstarter.org/WinConfig
########################################
Write-BoxstarterMessage "Configuring Windows"

Update-ExecutionPolicy Unrestricted

Enable-RemoteDesktop

Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -EnableShowFullPathInTitleBar -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder

# This requires restarts, disable for now
# Disable-UAC

Disable-GameBarTips
Disable-InternetExplorerESC

Set-TaskbarOptions -Size Small -Lock -Dock Bottom -Combine Full

# Move-LibraryDirectory "Documents""$env:UserProfile\skydrive\documents"

if (Test-PendingReboot) { Invoke-Reboot }
########################################

########################################
# Applications. See https://chocolatey.org/packages
########################################
Write-BoxstarterMessage "Installing Applications"

cinst DotNet3.5 -y
cinst LinkShellExtension -y
cinst GoogleChrome -y
cinst Paint.Net -y
cinst WinDirStat -y
cinst RoboForm -y
cinst Dropbox -y
cinst Launchy -y
cinst Spotify -y
cinst Kdiff3 -y
cinst GitExtensions -y
cinst JRE8 -y
cinst DisplayFusion -y
cinst ConEmu -y
cinst MySql.Workbench -y
cinst TeamViewer -y
cinst WebPI -y
cinst VisualStudioCode -y
cinst WebStorm -y
cinst DataGrip -y
cinst Slack -y
cinst K-LiteCodecPackMega -y
cinst OpenLiveWriter -y
cinst Office365Business -y
cinst VMWareWorkstation -y
cinst nodejs.install

cinst MSSQLServerManagementStudio2014Express -y
if (Test-PendingReboot) { Invoke-Reboot }

# Provide optional product key with: --installargs "/ProductKey YOURKEYHERE"
cinst VisualStudio2015Enterprise -y -packageParameters "--AdminFile http://bit.ly/win10boxstarter-vsadmin"
if (Test-PendingReboot) { Invoke-Reboot }

Install-ChocolateyVsixPackage SpellChecker http://bit.ly/win10boxstarter-vs-spellchecker

Install-ChocolateyVsixPackage SaveAllTheTime http://bit.ly/win10boxstarert-vs-saveallthetime

Install-ChocolateyVsixPackage BuildOnSave ttps://bit.ly/win10boxstarert-vs-buildonsave

# ReSharper
cinst resharper-platform -y

# Additonal software that doesn't have packages
# ESET
# EditPad Pro C:\EditPad\SetupEditPadPro736.exe /silent
# ACDSee
# PreCode
#
# ToDo: Add registery keys
#
# [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters](time) "Type"="NoSync"(off) "Type"="NTP" (on)
# [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tzautoupdate](time zone) "Start"=dword:00000003 (off) "Start"=dword:00000004 (on)
########################################

########################################
# SQL Server
########################################
# ToDo: Create SQL Server NuGet package with ability to take Configuration file URL
# See VS package for example: https://chocolatey.org/packages/VisualStudio2015Enterprise
# cinst http://path.to.NuGet.Package
# if (Test-PendingReboot) { Invoke-Reboot }
########################################

########################################
# Taskbar Icons
########################################
Write-BoxstarterMessage "Creating Pinned Taskbar Items"

#Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"
#copy-item (Join-Path (Get-PackageRoot($MyInvocation)) 'console.xml') -Force $env:appdata\console\console.xml

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft VS Code\Code.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\GitExtensions\GitExtensions.exe"
Install-ChocolateyPinnedTaskBarItem "$env:APPDATA\Spotify\Spotify.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles)\ConEmu\ConEmu64.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.com"
########################################

########################################
# Windows Updates
########################################
Enable-MicrosoftUpdate

Install-WindowsUpdate -AcceptEula -Criteria "IsAssigned=1 and IsHidden=0 and IsInstalled=0" -SuppressReboots
if (Test-PendingReboot) { Invoke-Reboot }
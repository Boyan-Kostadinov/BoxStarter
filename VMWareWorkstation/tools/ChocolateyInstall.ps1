﻿$arguments          = @{
    file            = 'VMware-workstation-full-12.5.5-5234757.exe'
    url             = 'https://download3.vmware.com/software/wkst/file/VMware-workstation-full-12.5.5-5234757.exe'
    checksum        = 'EF471E8080A7B7B9B2947A8033C32D6F346DC5A21F61022BA49B1DF77BEDDB55'
    silentArgs      = '/s /nsr /v/qn EULAS_AGREED=1'
}

Install-CustomPackage $arguments

Invoke-PinApplication (Join-Path ${env:ProgramFiles(x86)} 'VMware\VMware Workstation\vmware.exe')

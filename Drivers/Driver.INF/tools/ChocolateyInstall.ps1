﻿$packageChecksum    = '85A18EE2CE3818EB7F8C711BE32E8B2E3FD6D0B20D56D2F6F7A5B347F5C7B82CD1E9A7E0B170C4B819E1223B956E47B37CF7F2728ECE52C43A3D3D5ED91CD7FA'
$arguments          = @{
    file            = 'INF(v10.1.2.10).zip'
    url             = 'http://asrock.pc.cdn.bitgravity.com/Drivers/Intel/INF/INF(v10.1.2.10).zip'
    checksum        = 'D1E9A7E0B170C4B819E1223B956E47B37CF7F2728ECE52C43A3D3D5ED91CD7FA'
    executable      = 'INF(v10.1.2.10)\SetupChipset.exe'
    silentArgs      = '/S /v/qn'
}

Install-CustomPackage $arguments

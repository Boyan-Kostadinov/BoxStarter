﻿$arguments          = @{
    file            = 'datagrip-2017.1.1.exe'
    url             = 'https://download.jetbrains.com/datagrip/datagrip-2017.1.1.exe'
    checksum        = '6AA8F4B0803B67B9A9C4616FE15DA8EE51F9488569D98162A41E52E1A5DDB92B'
    silentArgs      = '/S'
}

Install-Package $arguments

﻿$packageChecksum    = '7F2303EA30E9EF82C5E9FAB624B91E6972789C768FD8C569311DE3173733C6A17E3970F0ABC9B0E6F71112F9BDD4933366933366025EE7C29563C6765752B32B'
$arguments          = @{
    file            = 'MSBuild.zip'
    destination     = 'C:\Program Files (x86)\MSBuild'
}

Install-WithCopy $arguments

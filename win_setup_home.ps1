#install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#chocolatey licence extension
choco upgrade chocolatey.extension -y

choco install 7zip -y
choco install audioswitcher -y
choco install boxstarter -y
choco install cpu-z -y
choco install crystaldiskmark -y
choco install foxitreader -y
choco install garmin-express -y
choco install gpu-z -y
choco install hwinfo -y
choco install logitech-options -y
choco install logioptionsplus -y
choco install paint.net -y
choco install passwordsafe -y
choco install samsung-magician -y
choco install teamviewer -y
choco install throttlestop -y
choco install vlc -y
choco install whatsapp -y
choco install windirstat -y
choco install winscp -y
choco install zoom -y

#refresh the environment to have access to new tools
refreshenv 

#boxstarter setup
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
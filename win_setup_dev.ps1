#install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#install chocolatey distributed tools
choco install azure-cli -y
choco install azure-data-studio -y
choco install chromium -y
choco install docker-desktop -y
choco install foxitreader -y
choco install git -y
choco install golang -y
choco install hg -y
choco install linqpad -y
choco install microsoftazurestorageexplorer -y
choco install nodejs -y
choco install poshgit -y
choco install postman -y
choco install slack -y
choco install totalcommander -y
choco install visualstudiocode -y
choco install winmerge -y

#configure vs code
code --install-extension DotJoshJohnson.xml
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.powershell
code --install-extension PeterJausovec.vscode-docker

#extra win features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient
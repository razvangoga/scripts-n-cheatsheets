#install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#install chocolatey distributed tools
choco install azure-cli -y
choco install azure-data-studio -y
choco install chromium -y
choco install docker-desktop -y
choco install dotnetcore-sdk -y
choco install dotnet-sdk -y
choco install drawio -y
choco install etcher -y
choco install fiddler -y
choco install firefox -y
choco install firefox-dev --pre -y
choco install foxitreader -y
choco install git -y
choco install golang -y
choco install jetbrainstoolbox -y
choco install lens -y
choco install linqpad -y
choco install microsoftazurestorageexplorer -y
choco install microsoft-edge -y
choco install microsoft-teams -y
choco install microsoft-windows-terminal -y
choco install nodejs -y
choco install nswagstudio -y
choco install opera -y
choco install poshgit -y
choco install postman -y
choco install powertoys -y
choco install powershell-core -y
choco install rdmfree -y
choco install ServiceBusExplorer -y
choco install slack -y
choco install skype -y
choco install sqlyog -y
choco install sysinternals -y
choco install totalcommander -y
choco install visualstudiocode -y
choco install winmerge -y

#refresh the environment to have access to new tools
refreshenv 

#extra powershell modules
#Install-Module oh-my-posh -Scope CurrentUser
#https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx

#dotnetcore global tools
dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool

#configure vs code
code --install-extension DotJoshJohnson.xml
code --install-extension eamodio.gitlens
code --install-extension heaths.vscode-guid
code --install-extension hediet.vscode-drawio
code --install-extension humao.rest-client
code --install-extension johnpapa.vscode-peacock
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.csharp
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode-remote.vscode-remote-extensionpack

#extra win features
Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient

#wsl 2
#https://docs.microsoft.com/en-us/windows/wsl/install-win10
#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
Copy-Item .wslconfig "$env:USERPROFILE\.wslconfig"

#wsl distros
#https://docs.microsoft.com/en-us/windows/wsl/install-manual
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile ubuntu.appx -UseBasicParsing
Add-AppxPackage .\ubuntu.appx
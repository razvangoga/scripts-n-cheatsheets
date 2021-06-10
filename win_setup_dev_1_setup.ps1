#extra powershell modules
#Install-Module oh-my-posh -Scope CurrentUser
#https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx

#set powershell profile
#pscore
New-Item -ItemType file "$home\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force
Copy-Item profile.ps1 "$home\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
#ps
New-Item -ItemType file "$home\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Force
Copy-Item profile.ps1 "$home\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

#dotnetcore global tools
dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool

#configure vs code
code --install-extension DotJoshJohnson.xml
code --install-extension eamodio.gitlens
code --install-extension github.github-vscode-theme
code --install-extension heaths.vscode-guid
code --install-extension hediet.vscode-drawio
code --install-extension humao.rest-client
code --install-extension jebbs.plantuml
code --install-extension johnpapa.vscode-peacock
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-azuretools.vscode-tye
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vsliveshare.vsliveshare

#extra win features
Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient

#wsl 2
#https://docs.microsoft.com/en-us/windows/wsl/install-win10
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile wsl_update_x64.msi
& .\wsl_update_x64.msi

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
Copy-Item .wslconfig "$env:USERPROFILE\.wslconfig"

wsl --set-default-version 2

#install wsl 2 distros
Start-Process https://www.microsoft.com/store/productId/9NBLGGH4MSV6
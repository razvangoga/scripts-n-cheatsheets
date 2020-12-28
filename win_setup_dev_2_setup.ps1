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
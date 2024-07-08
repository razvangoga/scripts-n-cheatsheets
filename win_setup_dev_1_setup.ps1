#extra powershell modules
#Install-Module oh-my-posh -Scope CurrentUser
#https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx

#Powershell modules
Install-Module -Name Terminal-Icons -Repository PSGallery

Install-Module -Name Az -Force -AllowClobber
Install-Module -Name PSReadLine -Force
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Install-Module -Name CompletionPredictor -Repository PSGallery
Import-Module -Name CompletionPredictor
Install-module -Name Az.Tools.Predictor -Force
Import-Module -Name Az.Tools.Predictor

#set powershell profile
. $pwd\win_setup_dev_1_setup_ps_profile.ps1

#dotnetcore global tools
dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g GitVersion.Tool
dotnet tool install -g Microsoft.Tye --version "0.11.0-alpha.22111.1"
dotnet tool install -g nbgv
dotnet tool install -g tye2 --version 0.11.10

#extra win features
Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient

#wsl
#https://devblogs.microsoft.com/commandline/install-wsl-with-a-single-command-now-available-in-windows-10-version-2004-and-higher/
wsl --install
wsl --set-default-version 2

Copy-Item .wslconfig "$env:USERPROFILE\.wslconfig"

#install wsl distros
wsl --install -d Ubuntu
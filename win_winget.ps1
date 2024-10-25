
winget install Microsoft.AzureCLI
winget install Microsoft.AzureDataStudio
winget install Microsoft.Azure.StorageExplorer
winget install Microsoft.Bicep
winget install Microsoft.DotNet.SDK.8
winget install Microsoft.Edge
winget install Microsoft.NuGet
winget install Microsoft.PowerToys
winget install Microsoft.PowerShell
winget install Microsoft.Office
winget install Microsoft.Skype 
winget install Microsoft.Teams
winget install Microsoft.VisualStudio.2022.Community
winget install Microsoft.VisualStudioCode
winget install Microsoft.WindowsTerminal

winget install LINQPad.LINQPad.8
winget install Volta.Volta

#nuget credential manager
#iex "& { $(irm https://aka.ms/install-artifacts-credprovider.ps1) }"
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://aka.ms/install-artifacts-credprovider.ps1'))
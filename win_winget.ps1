
winget install Microsoft.AzureCLI
winget install Microsoft.AzureDataStudio
winget install Microsoft.AzureStorageExplorer
winget install Microsoft.Bicep
winget install Microsoft.DotNet.SDK.6
winget install Microsoft.DotNet.SDK.7
winget install Microsoft.Edge
winget install LINQPad.LINQPad.8
winget install Microsoft.NuGet
winget install Microsoft.PowerToys
winget install Microsoft.PowerShell
winget install Microsoft.Office
winget install Microsoft.Skype 
winget install Microsoft.Teams
winget install Microsoft.VisualStudio.2022.Community
winget install Microsoft.VisualStudioCode
winget install Microsoft.WindowsTerminal

#nuget credential manager
#iex "& { $(irm https://aka.ms/install-artifacts-credprovider.ps1) }"
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://aka.ms/install-artifacts-credprovider.ps1'))
$docsPath = [Environment]::GetFolderPath("MyDocuments")

#pscore
New-Item -ItemType file "$docsPath\PowerShell\Profile.ps1" -Force
Copy-Item profile.ps1 "$docsPath\PowerShell\Profile.ps1" -Force
#ps
New-Item -ItemType file "$docsPath\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Force
Copy-Item profile.ps1 "$docsPath\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Force
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
Import-Module -Name Terminal-Icons
oh-my-posh --init --shell pwsh --config E:/OneDrive/Work/scripts-n-cheatsheets/ohmyposh.json | Invoke-Expression

Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
           [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
  }

# aliases
Set-Alias -Name dc -Value docker-compose -Force

#https://learn.microsoft.com/en-us/windows/terminal/command-line-arguments?tabs=windows
function New-Tab { wt -w 0 nt -d . }
Set-Alias -Name wtnt -Value New-Tab

#temps
Set-Alias -Name tyed -Value d:\_work\oss\tye\artifacts\bin\tye\Debug\net6.0\tye.exe -Force
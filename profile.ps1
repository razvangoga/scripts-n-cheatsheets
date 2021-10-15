Import-Module -Name Terminal-Icons
oh-my-posh --init --shell pwsh --config E:/OneDrive/Work/scripts-n-cheatsheets/ohmyposh.json | Invoke-Expression

Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
Set-Alias -Name dc -Value docker-compose

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
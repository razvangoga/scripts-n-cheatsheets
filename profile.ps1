Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config D:/_work/me/scripts-n-cheatsheets/ohmyposh.json | Invoke-Expression

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
Set-Alias -Name cdm -Value codium

function dotnet-restore-build { dotnet restore; dotnet build }
Set-Alias -Name drdb -Value dotnet-restore-build

function docker-compose-fn { docker compose $args }
Set-Alias -Name dc -Value docker-compose-fn

function git-checkout { git checkout $args }
Set-Alias -Name gtc -Value git-checkout

function git-fetch { git fetch }
Set-Alias -Name gtf -Value git-fetch

function git-fetch-pull { git fetch; git pull }
Set-Alias -Name gtfp -Value git-fetch-pull

function git-pull { git pull }
Set-Alias -Name gtp -Value git-pull

function git-checkout-branch { git checkout -b $args }
Set-Alias -Name gtcb -Value git-checkout-branch

#https://learn.microsoft.com/en-us/windows/terminal/command-line-arguments?tabs=windows
function New-Tab { wt -w 0 nt -d . }
Set-Alias -Name wtnt -Value New-Tab
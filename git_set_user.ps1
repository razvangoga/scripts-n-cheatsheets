param (
    [Parameter(Mandatory = $true)][string]$folder,
    [Parameter(Mandatory = $false)][string]$userName,
    [Parameter(Mandatory = $false)][string]$email
)

if (-not (Test-Path -Path $folder)) {
    Write-Error 'Folder does not exist'
    Exit 1
}

$profileFileName = "rg_profile.json"
$profilePath = Join-Path -Path $folder -ChildPath $profileFileName
$credentialsConfigExist = Test-Path -Path $profilePath
$credentialsGivenAsPrms = $userName -And $email 


$credentials = [PSCustomObject]@{
    userName = ''
    email    = ''
    commands = @()
}

$hasGitRepos = $false


if ($credentialsConfigExist) {
    $credentials = (Get-Content $profilePath) | ConvertFrom-Json
}
elseif ($credentialsGivenAsPrms) {
    $credentials.userName = $userName
    $credentials.email = $email
}
else {
    Write-Error "Give user credentials either via parameters or via an $profileFileName located in the target folder"
    Exit 1
}

Clear-Host
Write-Host "Setting the userName and email for all repos to <$($credentials.userName) ($($credentials.email))>"
Write-Host ""

$originalLocaltion = Get-Location

Get-ChildItem -Directory -Path $folder | Foreach-Object {
    $repo = $_.FullName
    $gitFolder = Join-Path -Path $repo -ChildPath '.git'
    if (-not (Test-Path -Path $gitFolder)) {
        Write-Warning "$repo -> is not a git repo"
    }
    else {
        Write-Host "$repo -> setting user info"
        $hasGitRepos = $true

        & git -C $repo config user.email $credentials.userName
        & git -C $repo config user.name $credentials.email

        Set-Location $repo

        foreach ($command in $credentials.commands)
        {
            Invoke-Expression $command
        }
    }
}

Set-Location $originalLocaltion
Write-Host ""

if ($hasGitRepos) {
    Write-Host "User updated in all git repos found"
}
else {
    Write-Warning "No git repos found to update"
}
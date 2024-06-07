param (
    [Parameter(Mandatory = $true)][string]$folder,
    [Parameter(Mandatory = $false)][string]$userName,
    [Parameter(Mandatory = $false)][string]$email,
    [Parameter(Mandatory = $false)][string]$sshKey
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
    sshKey   = ''
    commands = @()
}

$hasGitRepos = $false


if ($credentialsConfigExist) {
    $credentials = (Get-Content $profilePath) | ConvertFrom-Json
}
elseif ($credentialsGivenAsPrms) {
    $credentials.userName = $userName
    $credentials.email = $email
    $credentials.sshKey = $sshKey
}
else {
    Write-Error "Give user credentials either via parameters or via an $profileFileName located in the target folder"
    Exit 1
}

Clear-Host

$sshFolder = "$env:USERPROFILE/.ssh"

if ($IsMacOS) {
    Write-Host "Setting up ssh key access rights for macos"
    $sshFolder = "~/.ssh"

    & chmod 600 $sshFolder/$($credentials.sshKey)
    & chmod 644 $sshFolder/$($credentials.sshKey).pub
}


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
        Write-Host "$repo -> setting user info" -ForegroundColor Black -BackgroundColor Yellow
        $hasGitRepos = $true

        & git -C $repo config user.email $credentials.userName
        & git -C $repo config user.name $credentials.email
        & git -C $repo config core.sshCommand "ssh -i $sshFolder/$($credentials.sshKey)"
        
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
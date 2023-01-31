param (
    [Parameter(Mandatory = $true)][string]$folder,
    [Parameter(Mandatory = $true)][string]$userName,
    [Parameter(Mandatory = $true)][string]$email
)

if (-not (Test-Path -Path $folder)) {
    Write-Error 'Folder does not exist'
    Exit 1
}

$hasGitRepos = $false

Get-ChildItem -Directory -Path $folder | Foreach-Object {
    $repo = $_.FullName
    $gitFolder = Join-Path -Path $repo -ChildPath '.git'
    if (-not (Test-Path -Path $gitFolder)) {
        Write-Warning "$repo -> is not a git repo"
    } else {
        Write-Host "$repo -> setting user info"
        $hasGitRepos = $true

        & git -C $repo config user.email $userName
        & git -C $repo config user.name $email
    }
}

Write-Host ""

if($hasGitRepos) {
    Write-Host "User updated in all git repos found"
} else {
    Write-Warning "No git repos found to update"
}

# user.email=r.goga@enbw.com
# user.name=Razvan Goga


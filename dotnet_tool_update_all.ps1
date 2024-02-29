foreach ($toolInfoRow in $(dotnet tool list -g | Select-Object -Skip 2)) 
{
    $toolInfo = $toolInfoRow.Split(" ", [StringSplitOptions]::RemoveEmptyEntries)
    $toolName = $toolInfo[0]
    $toolVersion = $toolInfo[1].Trim()

    # Fetch version from NuGet
    $nugetInfo = (dotnet tool search --take 1 $toolName | Select-Object -Skip 2)
    $nugetVersion = $nugetInfo.Split(" ", [StringSplitOptions]::RemoveEmptyEntries)[1].Trim()

    if ($nugetVersion -ne $toolVersion)
    {
        Write-Host "dotnet tool update -g $toolName"
        dotnet tool update -g $toolName
    }
    else
    {
        Write-Host "Skip $toolName (no updates available)"
    }
}
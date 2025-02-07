Clear-Host

codium --install-extension bierner.markdown-mermaid --force
codium --install-extension DavidAnson.vscode-markdownlint --force
codium --install-extension DotJoshJohnson.xml --force
codium --install-extension eamodio.gitlens --force
codium --install-extension GitHub.github-vscode-theme --force
codium --install-extension GrapeCity.gc-excelviewer --force
codium --install-extension hashicorp.terraform --force
codium --install-extension hediet.vscode-drawio --force
codium --install-extension hilleer.yaml-plus-json --force
codium --install-extension jebbs.plantuml --force
codium --install-extension jock.svg --force
codium --install-extension johnpapa.vscode-peacock --force
codium --install-extension mikestead.dotenv --force
codium --install-extension redhat.vscode-yaml --force

$extensions = @(
    @{ publisher="creinbacher"; extension="xpathtester"; },
    @{ publisher="digital-molecules"; extension="service-bus-explorer"; },
    @{ publisher="donjayamanne"; extension="kusto"; },
    @{ publisher="GitHub"; extension="copilot"; },
    @{ publisher="heaths"; extension="vscode-guid"; },
    @{ publisher="henoc"; extension="svgeditor"; },
    @{ publisher="ms-azure-devops"; extension="azure-pipelines"; },
    @{ publisher="ms-azuretools"; extension="vscode-bicep"; },
    @{ publisher="ms-azuretools"; extension="vscode-cosmosdb"; },
    @{ publisher="ms-mssql"; extension="mssql"; },
    @{ publisher="ms-mssql"; extension="sql-database-projects-vscode"; },
    @{ publisher="ms-vscode"; extension="PowerShell"; }
)

Install-Module -Name PowerHTML 

# get the html of a webpage
function Get-WebPage {
    param (
        [string]$publisher,
        [string]$extension
    )

    $name = "$($publisher).$($extension)"
    $extensionpageUrl = "https://marketplace.visualstudio.com/items?itemName=$name"

    $response = Invoke-WebRequest -Uri $extensionpageUrl
    $html = ConvertFrom-Html $response
    $json =$html.SelectSingleNode("//script[@class='jiContent']").innerText.Trim() | ConvertFrom-Json
    $latestVersion = $json.Versions[0].version

    $downloadUrl = "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/$publisher/vsextensions/$extension/$latestVersion/vspackage"
    
    Write-Host "$name found v$latestVersion as latest version - downloading from $downloadUrl"

    Invoke-WebRequest -Uri $downloadUrl -OutFile "$name-$latestVersion.vsix"
}

foreach ($extension in $extensions) {
    Get-WebPage $extension.publisher $extension.extension
}

Get-ChildItem -Path $PSScriptRoot -Filter *.vsix | Sort-Object $._FullName | ForEach-Object {
    codium --install-extension $_.FullName --force
}

Remove-Item * -Include *.vsix -Force
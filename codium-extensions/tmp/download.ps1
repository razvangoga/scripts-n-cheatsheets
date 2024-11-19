# a powershell arry of strings
$urls = @(
    "digital-molecules.service-bus-explorer",
    "ms-azure-devops.azure-pipelines"
)

Install-Module -Name PowerHTML 

# get the html of a webpage
function Get-WebPage {
    param (
        [string]$name
    )
    # $wc = New-Object System.Net.WebClient
    # $wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3")
    # $html = $wc.DownloadString("https://marketplace.visualstudio.com/items?itemName=$name")

    $response = Invoke-WebRequest -Uri "https://marketplace.visualstudio.com/items?itemName=$name"
    $html = ConvertFrom-Html $response
    $json =$html.SelectSingleNode("//script[@class='jiContent']").innerText.Trim()

    # save html to file
    $json | Out-File "$name.json"
}

# call get-webpage for each url
foreach ($url in $urls) {
    Get-WebPage $url
}
codium --install-extension bierner.markdown-mermaid
codium --install-extension creinbacher.xpathtester
codium --install-extension DavidAnson.vscode-markdownlint
codium --install-extension DotJoshJohnson.xml
codium --install-extension eamodio.gitlens
codium --install-extension GitHub.github-vscode-theme
codium --install-extension GrapeCity.gc-excelviewer
codium --install-extension hashicorp.terraform
codium --install-extension hediet.vscode-drawio
codium --install-extension hilleer.yaml-plus-json
codium --install-extension jebbs.plantuml
codium --install-extension jock.svg
codium --install-extension johnpapa.vscode-peacock
codium --install-extension mikestead.dotenv
codium --install-extension redhat.vscode-yaml

Get-ChildItem -Path $PSScriptRoot -Filter *.vsix | Sort-Object $._FullName | ForEach-Object {
    codium --install-extension $_.FullName
}
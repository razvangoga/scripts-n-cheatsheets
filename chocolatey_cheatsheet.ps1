#view all packages installed via choco
choco list --local-only

#view packages with pending updates
choco upgrade all --noop

choco upgrade all -y

#freeze package to specific version
choco pin
choco pin list
choco pin add --name=git --version=1.2.3
choco pin remove --name git

#wsl update
wsl -d "Ubuntu-18.04" -u root -e apt update && wsl -d "Ubuntu-18.04" -u root -e apt upgrade -y
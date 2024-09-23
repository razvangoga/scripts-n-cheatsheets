#!/bin/sh

#omakub
wget -qO- https://omakub.org/install | bash

cd ~/Downloads

#disable omakub shortcuts - they conflict with Jetbrains tools
gsettings set org.gnome.shell.keybindings switch-to-application-1 "[]"   
gsettings set org.gnome.shell.keybindings switch-to-application-2 "[]"   
gsettings set org.gnome.shell.keybindings switch-to-application-3 "[]"   
gsettings set org.gnome.shell.keybindings switch-to-application-4 "[]"   
gsettings set org.gnome.shell.keybindings switch-to-application-5 "[]"   
gsettings set org.gnome.shell.keybindings switch-to-application-6 "[]"   
gsettings set org.gnome.shell.keybindings switch-to-application-7 "[]"   
gsettings set org.gnome.shell.keybindings switch-to-application-8 "[]"   
gsettings set org.gnome.shell.keybindings switch-to-application-9 "[]"   

#microsoft edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg

sudo apt update && sudo apt install microsoft-edge-stable

# dotnet
wget https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh -v 6.0.425
./dotnet-install.sh -v 8.0.303
./dotnet-install.sh -v 8.0.401

# dotnet configurations
dotnet tool update -g linux-dev-certs
dotnet linux-dev-certs install

# dotnet global tools
dotnet tool install -g dotnet-depends
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g GitVersion.Tool
dotnet tool install -g nbgv
dotnet tool install -g tye2 --version 0.11.10


#jetbrains toolbox
sudo apt install libfuse2
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

#azure cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#tools
curl -s https://ohmyposh.dev/install.sh | bash -s

snap install azuredatastudio
snap install chromium
snap install drawio
snap install gitkraken --classic
snap install powershell --classic
snap install storage-explorer

#onedrive sync
sudo apt install onedrive #https://ubuntuhandbook.org/index.php/2024/02/install-onedrive-ubuntu/
onedrive --synchronize --single-directory 'Projects'
onedrive --synchronize --single-directory 'Work'

systemctl enable --user onedrive
systemctl start --user onedrive
systemctl status --user onedrive

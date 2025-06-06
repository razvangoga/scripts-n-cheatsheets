#!/bin/sh

# do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES
# show Library folder
chflags nohidden ~/Library
# show hidden files
defaults write com.apple.Finder AppleShowAllFiles true
# show path bar
defaults write com.apple.finder ShowPathbar -bool true
# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

killall Finder;
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#home
brew install --cask balenaetcher

brew tap homebrew/cask-drivers
brew install garmin-express

brew install --cask alt-tab
brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
brew install eza
brew install --cask iterm2
brew install --cask microsoft-edge
brew install --cask sublime-text
brew install --cask tg-pro
brew install --cask whatsapp
brew install --cask zoom

#dev
brew install azure-cli
brew install --cask chromium --no-quarantine
brew install --cask commander-one
brew install --cask docker
brew install --cask drawio
brew install --cask firefox
brew install --cask fork
brew install git
brew install --cask gitkraken
brew install go
brew install helm
brew install httpie
brew install --cask jetbrains-toolbox
brew install jq
brew install --cask lens
brew install --cask microsoft-azure-storage-explorer
brew install --cask microsoft-teams
brew install minikube
brew install nerdfetch
brew install node
brew install --cask obsidian
brew install oh-my-posh
brew install openjdk
brew install --cask postman
brew install --cask powershell
brew install --cask raspberry-pi-imager
brew install --cask remote-desktop-manager-free
brew install --cask teamviewer
brew install terraform
brew install volta
brew install --cask visual-studio-code
brew install --cask vscodium
brew install wget

#dotnet
./macos_reinstall_old_dotnet_sdks.sh

cp .zshrc ~/.zshrc && source ~/.zshrc
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
brew install --cask microsoft-edge
brew install --cask sublime-text
brew install --cask whatsapp
brew install --cask zoom

#dev
brew install azure-cli
brew install --cask azure-data-studio
brew install --cask chromium
brew install --cask commander-one
brew install --cask docker
brew install --cask drawio
brew install --cask firefox
brew install git
brew install --cask gitkraken
brew install go
brew install helm
brew install --cask iterm2
brew install --cask jetbrains-toolbox
brew install --cask lens
brew install --cask microsoft-azure-storage-explorer
brew install --cask microsoft-teams
brew install minikube
brew install node@16 && brew link --force node@16
brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
brew install oh-my-posh
brew install openjdk
brew install --cask postman
brew install --cask powershell
brew install --cask remote-desktop-manager-free
brew install --cask teamviewer
brew install terraform
brew install --cask visual-studio-code

#dotnet
#official / latest
brew install --cask dotnet-sdk
# older https://github.com/isen-ng/homebrew-dotnet-sdk-versions
brew tap isen-ng/dotnet-sdk-versions
brew install --cask dotnet-sdk6-0-200

#cli tools
brew install exa
brew install httpie
brew install jq
brew install wget

cp .zshrc ~/.zshrc && source ~/.zshrc
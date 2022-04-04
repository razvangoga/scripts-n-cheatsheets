#!/bin/sh

defaults write com.apple.Finder AppleShowAllFiles true
cp .zshrc ~/.zshrc
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#home
brew install --cask microsoft-edge
brew install --cask sublime-text

#dev
brew install azure-cli
brew install --cask azure-data-studio
brew install --cask chromium
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
brew install --cask postman
brew install --cask powershell
brew install terraform
brew install --cask visual-studio-code
#!/bin/sh

#list installed packages
brew list

#see packages that can be upgrade (--greedy shows also ones marked as auto-updateable)
brew outdated --greedy

#update all installed packages
brew upgrade --greedy

#check homebrew status
brew doctor
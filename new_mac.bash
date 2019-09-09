#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew analytics off
brew update
brew doctor
brew bundle

git config --global user.name "Daniel Flook"
git config --global user.email "daniel.flook@ovoenergy.com"
git config --global credential.helper osxkeychain

ssh-keygen -t rsa -b 4096 -C "daniel.flook@ovoenergy.com"

defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

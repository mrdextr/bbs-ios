#!/bin/sh

sudo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install cask
brew cask install opensim
#brew cask install db-browser-for-sqlite
sudo gem install cocoapods
xcode-select --install

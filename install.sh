#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo 'Installing Xcode Command Line Tools...'
xcode-select --install
sleep 1
osascript <<EOD
  tell application "System Events"
    tell process "Install Command Line Developer Tools"
      keystroke return
      click button "Agree" of window "License Agreement"
    end tell
  end tell
EOD

echo 'Installing Homebrew...'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'Installing Homebrew Cask...'
brew install caskroom/cask/brew-cask

echo 'Running brew update...'
brew update

echo 'Installing git...'
brew install git

echo 'Installing spectacle...'
brew cask install spectacle

echo 'Installing Google Chrome...'
brew cask install google-chrome

echo 'Installing Boom'
brew cask install boom

echo 'Installing Sketch'
brew cask install sketch

echo 'Install Sketch Toolbox'
brew cask install sketch-toolbox

echo 'Installing Fish shell'
brew install fish

echo 'Setting Fish to be default shell'
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

echo 'Installing Slack'
brew cask install slack

echo 'Installing tmux'
brew install tmux

echo 'Installing Hammerspoon'
./hammerspoon/install.sh

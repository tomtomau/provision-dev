#!/bin/bash

echo "We're going to ask for your password just once, so feel free to go do something else after this, hopefully it should be done then 🎉"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# To install gcc, make etc. we need to include Xcode command line dev tools
# it's a stupid requirement but #macintoshlyf
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

# Setup homebrew, your main package manager
echo 'Installing Homebrew...'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Cask lets you install binary apps instead of source code, so we install a lot with cask
echo 'Installing Homebrew Cask...'
brew install caskroom/cask/brew-cask

echo 'Running brew update...'
brew update

# This install specific formulas from homebrew
formulas=(git tmux hub awscli)

for formula in ${formulas[*]}
do
	printf "Installing %s\n" $formula
	brew install $formula
done

# This installs specific apps via Homebrew Cask
casks=(balenaetcher google-chrome slack spotify jetbrains-toolbox virtualbox vagrant)
for cask in ${casks[*]}
do
	printf "Installing %s\n" $cask
	brew cask install $cask
done

# Start fish shell config
echo 'Installing Fish shell'
brew install fish

echo 'Setting Fish to be default shell'
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
# End fish shell config

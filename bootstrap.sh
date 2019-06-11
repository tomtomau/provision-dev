#!/bin/sh

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

mkdir -p ~/src/tomtomau/

git clone https://github.com/tomtomau/provision-dev.git ~/src/tomtomau/provision-dev

cd ~/src/tomtomau/provision-dev/
bash ./install.sh

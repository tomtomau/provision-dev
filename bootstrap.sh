#!/bin/sh

set -eux

# Update to Rosetta 2
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# To install gcc, make etc. we need to include Xcode command line dev tools
# it's a stupid requirement but #macintoshlyf
echo 'Installing Xcode Command Line Tools...'
xcode-select --install
softwareupdate --all --install --force

mkdir -p ~/src/tomtomau/

git clone https://github.com/tomtomau/provision-dev.git ~/src/tomtomau/provision-dev

cd ~/src/tomtomau/provision-dev/
bash ./install.sh

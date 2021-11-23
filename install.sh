#!/bin/sh
set -eux

# Setup homebrew, your main package manager
echo 'Installing Homebrew...'
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tom/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


echo 'Running brew update...'
brew update

brew install ansible

git remote remove origin
git remote add origin git@github.com:tomtomau/provision-dev.git

cd mac-ansible
make install

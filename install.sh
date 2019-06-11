#!/bin/sh

# Setup homebrew, your main package manager
echo 'Installing Homebrew...'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'Running brew update...'
brew update

brew install ansible

cd mac-ansible
git remote remove origin
git remote add origin git@github.com:tomtomau/provision-dev.git

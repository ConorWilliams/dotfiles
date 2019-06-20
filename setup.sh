#!/bin/bash

# run: 
# 
# sudo apt-get install git
# git clone https://github.com/ConorWilliams/dotfiles ~/.dotfiles
# cd ~/.dotfiles
# sudo bash ./setup.sh

echo 'Setting up'



apt-get update
apt-get upgrade


# set up zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

cp ~/.dotfiles/bash/.bash_profile ~/.bash_profile
cp ~/.dotfiles/zsh/.zshrc ~/.zshrc
cp ~/.dotfiles/X/.xinitrc ~/.xinitrc

# zsh

# chsh -s /usr/bin/zsh root

# set up i3
mkdir ~/.i3/
cp ~/.dotfiles/i3/config ~/.i3/config

cp ~/.dotfiles/imwheelrc/.imwheelrc ~/.imwheelrc

# install chrome
mkdir ~/downloads
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O ~/downloads/chrome.deb
sudo dpkg -i ~/downloads/chrome.deb
sudo apt install -f

apt-get update
apt-get upgrade



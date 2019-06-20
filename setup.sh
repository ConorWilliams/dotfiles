#!/bin/bash

# run: 
# 
# sudo apt-get install git
# git clone https://github.com/ConorWilliams/dotfiles ~/.dotfiles
# cd ~/.dotfiles
# sudo bash ./setup.sh

echo 'Setting up'

HERE = ~/.dotfiles

apt-get update
apt-get upgrade

# install a bunch of stuff
apt-get install i3 ubuntu-drivers-common mesa-utils mesa-utils-extra gnupg scrot xorg xserver-xorg wget unzip wpasupplicant fonts-hack-ttf zsh lxterminal rofi ranger i3lock redshift amixer alsamixer i3blocks xbacklight cmus thunderbird blueman x11-xserver-utils arandr pulseaudio acpi atom


# set up zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

sudo chsh -s $(which zsh)

ln $HERE/zsh/.zpofile ~/.zpofile
ln $HERE/zsh/.zshrc ~/.zshrc
ln $HERE/X/.xinitrc ~/.xinitrc

# set up i3
mkdir ~/.i3/
ln ~/.i3/config $HERE/i3/config
ln ~/.imwheelrc $HERE/imwheelrc/.imwheelrc

# install chrome
mkdir ~/downloads
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O ~/downloads/chrome.deb
sudo dpkg -i ~/downloads/chrome.deb
sudo apt install -f

apt-get update
apt-get upgrade



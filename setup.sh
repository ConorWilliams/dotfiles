#!/bin/bash

# run: 
# 
# sudo apt-get install git
# git clone https://github.com/ConorWilliams/dotfiles ~/.dotfiles
# cd ~/.dotfiles
# sudo bash ./setup.sh

echo 'Setting up'

mkdir ~/.config

apt-get update
apt-get upgrade

# install a bunch of stuff
apt install i3 ubuntu-drivers-common mesa-utils mesa-utils-extra gnupg scrot xorg xserver-xorg wget unzip wpasupplicant fonts-hack-ttf zsh lxterminal rofi ranger i3lock redshift alsa-utils alsa-base alsa-tools i3blocks xbacklight cmus thunderbird blueman x11-xserver-utils arandr pulseaudio acpi ranger pavucontrol vim unicode python-pip python3-pip texlive-full zathura software-properties-common

# alacritty
add-apt-repository ppa:mmstick76/alacritty
apt install alacritty
mkdir ~/.config/alacritty
ln -s ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# set up zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

ln -s ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

chsh -s $(which zsh) root
chsh -s $(which zsh) $USER

# set up i3
mkdir ~/.config/i3
ln -s ~/.dotfiles/i3/config ~/.config/i3/config

# other
ln -s ~/.dotfiles/X/.xinitrc ~/.xinitrc
ln -s ~/.dotfiles/imwheel/.imwheelrc ~/.imwheelrc

# set up zathura

mkdir ~/.config/zathura
ln -s ~/.dotfiles/zathura/zathurarc ~/.config/zathura/zathurarc

# install chrome
mkdir ~/downloads
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O ~/downloads/chrome.deb
sudo dpkg -i ~/downloads/chrome.deb
sudo apt install -f

apt-get update
apt-get upgrade



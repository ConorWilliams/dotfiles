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

# install a bunch of base stuff
apt-get install i3 ubuntu-drivers-common mesa-utils mesa-utils-extra gnupg scrot xorg xserver-xorg wget unzip wpasupplicant fonts-hack-ttf zsh lxterminal rofi ranger i3lock redshift-gtk alsa-utils alsa-base alsa-tools i3blocks xbacklight cmus thunderbird blueman bluez bluetooth x11-xserver-utils arandr pulseaudio acpi ranger pavucontrol vim unicode python-pip python3-pip zathura software-properties-common golang-go pcmanfm lxtask bc zip snapd curl vlc ubuntu-restricted-addons ubuntu-restricted-extras qdirstat feh gthumb lxappearance arc-theme network-manager-gnome

#texlive-full

read -p "Press enter to continue"

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

# chsh -s $(which zsh)
# sudo chsh -s $(which zsh)

read -p "Press enter to continue"

# python
pip3 install numpy scipy ujson clint halo tqdm
pip3 install git+https://github.com/ConorWilliams/rsinc

# rclone
curl https://rclone.org/install.sh | bash -s beta

# paper icons
sudo add-apt-repository ppa:snwh/ppa
sudo apt-get update
sudo apt-get install paper-icon-theme

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
read -p "Download chrome .deb (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  mkdir ~/downloads
  wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O ~/downloads/chrome.deb
  dpkg -i ~/downloads/chrome.deb
  apt install -f
else
  echo "no chrome";
fi

# install atom
read -p "Download atom .deb (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  mkdir ~/downloads
  wget "https://atom.io/download/deb" -O ~/downloads/atom.deb
  dpkg -i ~/downloads/atom.deb
  apt install -f
else
  echo "no chrome";
fi
  
  


# autologin
mkdir /etc/systemd/system/getty@tty1.service.d
cp ~/.dotfiles/X/override.conf /etc/systemd/system/getty@tty1.service.d/override.conf

chown -R conor ~/
chown -R conor ~/*

echo 'Done'

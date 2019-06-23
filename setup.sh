#!/bin/bash

# run: 
# 
# sudo apt-get install git
# git clone https://github.com/ConorWilliams/dotfiles ~/.dotfiles
# cd ~/.dotfiles
# sudo bash ./setup.sh

echo 'Setting up'

mkdir ~/.config
mkdir ~/downloads

apt-get update
apt-get upgrade

# install a bunch of base stuff                
cat apt_lib.txt | sed '/^#/d'| xargs apt-get install

# needs second apt-get to prevent confused dependencies
apt-get install network-manager-gnome 

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
  wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O ~/downloads/chrome.deb
  dpkg -i ~/downloads/chrome.deb
  apt install -f
else
  echo "no chrome";
fi

# install atom
read -p "Download atom .deb (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  ln -s ~/.dotfiles/atom ~/.atom
  wget "https://atom.io/download/deb" -O ~/downloads/atom.deb
  dpkg -i ~/downloads/atom.deb
  apt install -f
else
  echo "no chrome";
fi
  
# auto-login
mkdir /etc/systemd/system/getty@tty1.service.d
cp ~/.dotfiles/X/override.conf /etc/systemd/system/getty@tty1.service.d/override.conf

# change shell
sudo -u conor chsh -s $(which zsh)
sudo -u root chsh -s $(which zsh)

# Permissions
chown conor:conor -R /home/conor/
chown conor:conor -R /home/conor/*
chmod g+s /home/conor/

echo 'Now you just need to set paper + arc themes with lxappearance '


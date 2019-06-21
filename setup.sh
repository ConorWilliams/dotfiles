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

ln -s ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/X/.xinitrc ~/.xinitrc

chsh -s $(which zsh) root
chsh -s $(which zsh) $USER

# set up i3
mkdir ~/.i3/
ln -s ~/.dotfiles/i3/config ~/.i3/config
ln -s ~/.dotfiles/imwheel/.imwheelrc ~/.imwheelrc

# install chrome
mkdir ~/downloads
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O ~/downloads/chrome.deb
sudo dpkg -i ~/downloads/chrome.deb
sudo apt install -f

# font awesome
wget "https://use.fontawesome.com/releases/v5.0.13/fontawesome-free-5.0.13.zip" -O ~/downloads/awesome.zip
unzip ~/downloads/awesome.zip
sudo cp ~/downloads/awesome/use-on-desktop/* /usr/local/share/fonts/
fc-cache -f -v
#the next command help see the name to use
#here Font Awesome 5 Free
echo 'grepping...'
fc-list | grep -i "awe"

apt-get update
apt-get upgrade



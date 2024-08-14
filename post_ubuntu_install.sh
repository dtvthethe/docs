#!/bin/bash

# chmod +x post_ubuntu_install.sh
# ./post_ubuntu_install.sh


# App Brightness display
# Brightness and gamma applet

# ==================Create folder==================:
echo "Your Ubuntu is starting for create folders!"



# ==================Install==================:
echo "Your Ubuntu is starting for install apps!"
sudo apt-get update

# Install tools:
sudo apt-get install -y apt-transport-https
sudo apt install -y snapd

# Chrome:
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo apt-get update

# Sublime Text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Visual Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# Ibus Unikey
sudo add-apt-repository ppa:ubuntu-vn/ppa
sudo apt-get update
sudo apt-get install -y ibus-unikey
ibus restart

# Git
add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt-get install -y git

# Slack
sudo snap install slack

# Tree
sudo apt-get install tree

# tweak
sudo add-apt-repository universe
sudo apt install gnome-tweaks
# sudo apt install gnome-tweak-tool

# Extension Manager
sudo apt-get update
sudo apt-get upgrade
sudo apt install gnome-shell-extension-manager


# Font segoe-ui-linux
git clone https://github.com/mrbvrz/segoe-ui-linux
cd segoe-ui-linux
chmod +x install.sh
./install.sh
cd ..


# Docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

# Docker composer
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
docker-compose -f docker-compose.yml -f docker-compose.mysql.yml -f docker-compose.dev.yml up -d
sudo apt-get update
sudo apt-get upgrade

# ZSh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ==================Update==================:
sudo apt-get update
sudo apt autoremove
sudo apt autoclean

# ==================Show version==================:
git --version
google-chrome --version
subl -v
echo "Visual Code version:" && code -v
# echo "Setting password for mysql: https://www.notion.so/Mysql-d70f3fc6f6054f398e66390ace86d289?pvs=4"

echo "Install and config your Ubuntu Done!"

# sudo reboot

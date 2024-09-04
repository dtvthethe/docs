#!/bin/bash

# ==================Create folder==================:
echo "Your Ubuntu is starting for create folders!"
mkdir apps
mkdir workspaces
sudo chmod -R 777 apps/
sudo chmod -R 777 workspaces/

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
sudo apt update
sudo snap install --classic code

# Mysql Workbench
sudo apt install mysql-workbench

# Ibus Unikey
sudo add-apt-repository ppa:ubuntu-vn/ppa
sudo apt-get update
sudo apt-get install -y ibus-unikey
ibus restart

# Git
add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt-get install -y git

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

# Microsoft TrueType Fonts
# sudo add-apt-repository multiverse
# sudo apt update && sudo apt install ttf-mscorefonts-installer
# sudo fc-cache -f -v
# reinstall in case u reject the license agreement
# sudo apt install --reinstall ttf-mscorefonts-installer

git clone https://github.com/mrbvrz/segoe-ui-linux
cd segoe-ui-linux
chmod +x install.sh
./install.sh

# Tweak
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

# Extensions Manager
sudo apt-get update
sudo apt install gnome-shell-extension-manager


# Oh my zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# MySQl workbench
sudo snap install mysql-workbench-community

# ==================Update==================:
sudo apt-get update
sudo apt autoremove
sudo apt autoclean

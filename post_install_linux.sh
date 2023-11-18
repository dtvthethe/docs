#!/bin/bash

# ==================Create folder==================:
echo "Your Ubuntu is starting for create folders!"
mkdir apps
mkdir workspaces
sudo chmod -R 777 apps/
sudo chmod -R 777 workspaces/

# ==================Define variables==================:
echo "Do you want to install Skype: 'y' (yes) | other key no"
read isInstallSkype
echo "Do you want to install Docker: 'y' (yes) | other key no"
read isInstallDocker
echo "Do you want to install VNM + NodeJS: 'y' (yes) | other key no"
read isInstallNode

# If install nodejs
if [ $isInstallNode = "y" ]; then
  echo "Type VERSION NVM to install, Ex: 18.0.1:"
	read nvmVersion
	echo "Type VERSION Node to install, Ex: 18.0.1:"
	read nvmNodeVersion
fi


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

# DB Gate
wget https://github.com/dbgate/dbgate/releases/latest/download/dbgate-latest.deb
sudo apt install -y ./dbgate-latest.deb

# Ibus Unikey
sudo add-apt-repository ppa:ubuntu-vn/ppa
sudo apt-get update
sudo apt-get install -y ibus-unikey
ibus restart

# Git
add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt-get install -y git

# Mysql Server
sudo apt-get update
sudo apt-get install -y mysql-server

# Notion
sudo snap install notion-snap-reborn

# Skype
if [ $isInstallSkype = "y" ]; then
  sudo snap install skype
fi

# Docker
if [ $isInstallDocker = "y" ]; then
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
fi

# NVM + NodeJS
if [ $isInstallNode = "y" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${nvmVersion}/install.sh | bash
	source ~/.bashrc
	nvm install ${nvmNodeVersion}
fi

# Microsoft Todo
sudo snap install microsoft-todo-unofficial

# ==================Update==================:
sudo apt-get update
sudo apt autoremove
sudo apt autoclean

# ==================Show version==================:
git --version
google-chrome --version
subl -v
echo "Visual Code version:" && code -v
echo "Setting password for mysql: https://www.notion.so/Mysql-d70f3fc6f6054f398e66390ace86d289?pvs=4"

echo "Install and config your Ubuntu Done!"

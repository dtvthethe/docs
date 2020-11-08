#!/bin/bash
# This file using for install/config softwares for Xubuntu
# PLEASE MOVE THIS FILE TO `/home` FOLDER.

# php_storm_file_name = "PhpStorm-2020.2.3.tar.gz"

# ==================Create folder==================:
echo "Your Xubuntu is starting for create folders!"
mkdir Apps
mkdir Workspaces
sudo chmod -R 777 Apps/
sudo chmod -R 777 Workspaces/

echo "Your Xubuntu is starting for install apps!"
# ==================Install==================:
# 1. Apache2
sudo apt-get update
sudo apt-get install -y apache2
# 2. PHP
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.3 php7.3-fpm php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-cli php7.3-intl
# 3. Curl, Git, Unzip:
sudo apt-get update
sudo apt-get install -y curl git unzip
# 4. Composer:
sudo curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
# 5. Mysql Server
sudo apt-get update
sudo apt-get install -y mysql-server
sudo mysql_secure_installation
sudo mysql
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '-------password---------';
# 6. Chrome:
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo apt-get update
# 7. Pinta (App like Paint in Windows):
sudo snap install pinta-james-carroll
sudo apt-get update
# 8. Sublime Text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text
# 9. Visual Code
sudo snap install code --classic
# 10. Mysql Workbench
# sudo apt-get update
# sudo snap install mysql-workbench-community
echo "Your Xubuntu is starting for download apps!"
# ==================Download and Install==================
# 1. PHP Storm
wget https://download.jetbrains.com/webide/PhpStorm-2020.2.3.tar.gz
tar -xf PhpStorm-2020.2.3.tar.gz -C ~/Apps/

echo "Your Xubuntu is starting for config!"
# ==================Config==================
# 1. Bluetooth
sudo systemctl disable bluetooth.service
sudo systemctl disable bluetooth.service --force

echo "Your Xubuntu is starting for remove apps!"
# ==================Unistall==================
# 1. Pidgin
sudo apt-get remove -y pidgin
sudo apt-get autoremove -y pidgin
sudo apt-get purge -y pidgin
sudo apt-get autoremove --purge pidgin
# 2. xfce4-notes-plugin
sudo apt-get remove -y xfce4-notes
sudo apt-get autoremove -y xfce4-notes
sudo apt-get purge -y xfce4-notes
sudo apt-get autoremove --purge xfce4-notes
# 3.gnome-mines
sudo apt-get remove -y gnome-mines
sudo apt-get autoremove -y gnome-mines
sudo apt-get purge -y gnome-mines
sudo apt-get autoremove --purge gnome-mines
# 3.sudoku
sudo apt-get remove -y gnome-sudoku
sudo apt-get autoremove -y gnome-sudoku
sudo apt-get purge -y gnome-sudoku
sudo apt-get autoremove --purge gnome-sudoku
# 4. Document Viewer
sudo apt-get remove -y evince
sudo apt-get autoremove -y evince
sudo apt-get purge -y evince
sudo apt-get autoremove --purge evince
# 4. Simple Scan
sudo apt-get remove -y simple-scan
sudo apt-get autoremove -y simple-scan
sudo apt-get purge -y simple-scan
sudo apt-get autoremove --purge simple-scan
# 5. Thunderbird
sudo apt-get remove -y thunderbird
sudo apt-get autoremove -y thunderbird
sudo apt-get purge -y thunderbird
sudo apt-get autoremove --purge thunderbird
# 6. Xfburn
sudo apt-get remove -y xfburn
sudo apt-get autoremove -y xfburn
sudo apt-get purge -y xfburn
sudo apt-get autoremove --purge xfburn
# 7. Xfce4-dict
sudo apt-get remove -y xfce4-dict
sudo apt-get autoremove -y xfce4-dict
sudo apt-get purge -y xfce4-dict
sudo apt-get autoremove --purge xfce4-dict
# 8. Orage
sudo apt-get remove -y orage
sudo apt-get autoremove -y orage
sudo apt-get purge -y orage
sudo apt-get autoremove --purge orage
# 9. Gimp
sudo apt-get remove -y gimp
sudo apt-get autoremove -y gimp
sudo apt-get purge -y gimp
sudo apt-get autoremove --purge gimp

# 10. SGT Puzzles Collection
sudo apt-get remove -y sgt-launcher
sudo apt-get autoremove -y sgt-launcher
sudo apt-get purge -y sgt-launcher
sudo apt-get autoremove --purge sgt-launcher

# ==================Update==================:
sudo apt-get update
sudo apt autoremove
sudo apt autoclean

# ==================Show version==================:
mysql -V
php -v
composer -V
git --version
google-chrome --version
subl -v
echo "Visual Code version:" && code -v
mysql-workbench-community --version
echo "Install and config your Xubuntu Done!"

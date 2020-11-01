#!/bin/bash
# This file using for install/config softwares for Xubuntu
# PLEASE MOVE THIS FILE TO `/home` FOLDER.

# php_storm_file_name = "PhpStorm-2020.2.3.tar.gz"

# ==================Create folder==================:
echo "Your Xubuntu is starting for create folders!" &&
mkdir Apps &&
mkdir Workspaces &&
chmod -R 777 Apps/ &&
chmod -R 777 Workspaces/ &&

echo "Your Xubuntu is starting for install apps!" &&
# ==================Install==================:
# 1. Apache2
apt-get update &&
apt-get install -y apache2 &&
# 2. PHP
apt-get update &&
apt-get install -y software-properties-common &&
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php &&
apt-get update &&
apt-get install -y php7.3 php7.3-fpm php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-cli php7.3-intl &&
# 3. Curl, Git, Unzip:
apt-get update &&
apt-get install -y curl git unzip &&
# 4. Composer:
curl -sS https://getcomposer.org/installer -o composer-setup.php &&
php composer-setup.php --install-dir=/usr/local/bin --filename=composer &&
# 5. Mysql Server
apt-get update &&
apt-get install -y mysql-server &&
# 6. Chrome:
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
apt install -y ./google-chrome-stable_current_amd64.deb &&
apt-get update &&
# 7. Pinta (App like Paint in Windows):
snap install pinta-james-carroll &&
apt-get update &&
# 8. Sublime Text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - &&
apt-get install -y apt-transport-https &&
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list &&
apt-get update &&
apt-get install -y sublime-text &&
# 9. Visual Code
snap install code --classic &&
# 10. Mysql Workbench
apt-get install -y mysql-workbench &&
apt-get update &&
echo "Your Xubuntu is starting for download apps!" &&
# ==================Download and Install==================
# 1. PHP Storm
wget https://download.jetbrains.com/webide/PhpStorm-2020.2.3.tar.gz &&
tar -xf PhpStorm-2020.2.3.tar.gz -C ~/Apps/ &&

echo "Your Xubuntu is starting for config!" &&
# ==================Config==================
# 1. Bluetooth
systemctl disable bluetooth.service &&
systemctl disable bluetooth.service --force &&

echo "Your Xubuntu is starting for remove apps!" &&
# ==================Unistall==================
# 1. Pidgin
apt-get remove -y pidgin &&
apt-get autoremove pidgin &&
apt-get purge -y pidgin &&
apt-get autoremove --purge pidgin &&
# 2. xfce4-notes-plugin
apt-get remove -y xfce4-notes &&
apt-get autoremove xfce4-notes &&
apt-get purge -y xfce4-notes &&
apt-get autoremove --purge xfce4-notes &&
# 3.gnome-mines
apt-get remove -y gnome-mines &&
apt-get autoremove gnome-mines &&
apt-get purge -y gnome-mines &&
apt-get autoremove --purge gnome-mines &&
# 3.sudoku
apt-get remove -y gnome-sudoku &&
apt-get autoremove gnome-sudoku &&
apt-get purge -y gnome-sudoku &&
apt-get autoremove --purge gnome-sudoku &&
# 4. Document Viewer
apt-get remove -y evince &&
apt-get autoremove evince &&
apt-get purge -y evince &&
apt-get autoremove --purge evince &&
# 4. Simple Scan
apt-get remove -y simple-scan &&
apt-get autoremove simple-scan &&
apt-get purge -y simple-scan &&
apt-get autoremove --purge simple-scan &&
# 5. Thunderbird
apt-get remove -y thunderbird &&
apt-get autoremove thunderbird &&
apt-get purge -y thunderbird &&
apt-get autoremove --purge thunderbird &&
# 6. Xfburn
apt-get remove -y xfburn &&
apt-get autoremove xfburn &&
apt-get purge -y xfburn &&
apt-get autoremove --purge xfburn &&
# 7. Xfce4-dict
apt-get remove -y xfce4-dict &&
apt-get autoremove xfce4-dict &&
apt-get purge -y xfce4-dict &&
apt-get autoremove --purge xfce4-dict &&
# 8. Orage
apt-get remove -y orage &&
apt-get autoremove orage &&
apt-get purge -y orage &&
apt-get autoremove --purge orage &&

# ==================Update==================:
apt-get update &&
apt autoremove &&

# ==================Show version==================:
mysql -V &&
php -v &&
#composer -v &&
git --version &&
google-chrome --version &&
subl -v &&
#echo "Visual Code version:"
#code -v &&
mysql-workbench --version &&
echo "Install and config your Xubuntu Done!"

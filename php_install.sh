# ---------------- APACHE2 ---------------------
#!/bin/bash

apt-get update
apt-get install -y apache2
apt-get update
apt-get install -y software-properties-common
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y php7.3 php7.3-fpm php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-cli php7.3-intl
apt-get update
apt-get install -y curl git unzip
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
apt-get update
apt-get install -y mysql-server
apt-get install -y nano
mysql -v
php -v
composer -v
nano -v
git --version


# ---------------- NGINX ---------------------


#!/bin/bash

sudo apt-get update
sudo apt-get install -y nginx
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.4 php7.4-fpm php-pear php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml php7.4-cli php7.4-intl php7.4-redis
sudo apt-get update
sudo apt-get install -y curl git unzip
sudo curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo apt-get update
sudo apt-get install -y mysql-server
sudo apt update && sudo apt upgrade
sudo apt install -y  mysql-workbench
sudo apt install -y ./dbeaver-ce_22.2.5_amd64.deb
sudo apt install -y ./code_1.73.1-1667967334_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo apt-get update
sudo apt-get install -y build-essential software-properties-common
sudo apt-get install -y libsqlite3-dev ruby1.9.1-dev
sudo apt-get install -y libsqlite3-dev ruby-dev
sudo gem install mailcatcher
sudo apt install -y ./slack-desktop-4.28.184-amd64.deb
sudo apt update
sudo apt install -y redis-server
sudo apt update

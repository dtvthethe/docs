#!/bin/bash

apt-get update &&
apt-get install -y apache2 &&
apt-get update &&
apt-get install -y software-properties-common &&
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php &&
apt-get update &&
apt-get install -y php7.3 php7.3-fpm php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-cli php7.3-intl &&
apt-get update &&
apt-get install -y curl git unzip &&
curl -sS https://getcomposer.org/installer -o composer-setup.php &&
php composer-setup.php --install-dir=/usr/local/bin --filename=composer &&
apt-get update &&
apt-get install -y mysql-server &&
apt-get install -y nano &&
mysql -v &&
php -v &&
composer -v &&
nano -v &&
git --version

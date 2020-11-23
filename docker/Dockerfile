FROM ubuntu:16.04
RUN apt update && apt upgrade -y
RUN	apt install -y nano
RUN	apt install -y nginx
RUN	apt update && apt install -y software-properties-common
RUN	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN	apt update
RUN	apt install -y php7.3 php7.3-fpm php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-cli php7.3-intl
RUN	apt update
RUN	apt install -y curl git unzip
RUN	curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN	php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN	apt update

# settup project
COPY . /var/www/html/app
WORKDIR /var/www/html/app
RUN cd /var/www/html/app && composer install
RUN php artisan key:generate
RUN chmod -R 777 /var/www/html/app/storage/

# setting nginx config file
COPY ./lara.dev /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/lara.dev /etc/nginx/sites-enabled/
RUN nginx -t

# setting port:
EXPOSE 8080

# run main command
# COPY ./start_server.sh /
# RUN chmod 777 /./start_server.sh
# ENTRYPOINT ["/./start_server.sh"]
# CMD [""]

# docker run --name=<container name> -e MYSQL_ROOT_PASSWORD=<password> -e MYSQL_DATABASE=<db name> -d mysql:latest
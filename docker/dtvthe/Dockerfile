FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y nginx
RUN apt-get install -y php-fpm

WORKDIR /var/www/html/dtvthe
EXPOSE 80

ADD . /var/www/html/dtvthe

# ADD start.sh /start.sh
# RUN chmod 755 /start.sh

# ADD start.sh /usr/bin/start
# RUN chmod +x /usr/bin/start

RUN cp /var/www/html/dtvthe/site.example /etc/nginx/sites-available/default
# RUN ln -s /etc/nginx/sites-available/hihi.dev /etc/nginx/sites-enabled/
RUN service php7.0-fpm start
RUN service php7.0-fpm restart
RUN service nginx start
RUN service nginx restart

# ENTRYPOINT [ "start" ]
# CMD [ "/start.sh" ]
CMD ["nginx", "-g", "daemon off;"]

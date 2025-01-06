FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    wget \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN mkdir /run/php-fpm

COPY conf/wp-config.php /var/www/wordpress/wp-config-sample.php

##COPY ./tools/wordpress.sh /

##CMD [ "/wordpress.sh" ]
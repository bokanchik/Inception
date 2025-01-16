FROM debian:bullseye

RUN apt update
RUN apt install -y \
    php7.4 \
    php7.4-fpm \
    php-mysqli curl \
    php-gd \
    redis \
    php-redis

RUN PHP_FPM_PATH=$(command -v /usr/sbin/php-fpm*) && \
	ln -s $PHP_FPM_PATH /usr/bin/php-fpm

RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wordpress.sh . 

RUN chmod 777 ./wordpress.sh

EXPOSE 9000

CMD [ "./wordpress.sh" ]

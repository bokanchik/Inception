FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y \
    php-fpm \
    php-mysqli curl

RUN PHP_FPM_PATH=$(command -v /usr/sbin/php-fpm*) && \
	ln -s $PHP_FPM_PATH /usr/bin/php-fpm

RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wordpress.sh . 

RUN chmod 777 ./wordpress.sh

CMD [ "./wordpress.sh" ]

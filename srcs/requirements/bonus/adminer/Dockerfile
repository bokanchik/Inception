# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    php-pgsql \
    php-sqlite3 \
    php-mysqli \
    php-pdo \
    adminer \
    curl

RUN mkdir -p /var/www/html/ && chown -R www-data:www-data /var/www/html/

# Copy Adminer core file as index.php
RUN cp /usr/share/adminer/adminer.php /var/www/html/index.php

RUN chown www-data:www-data /var/www/html/index.php

RUN mkdir -p /run/php && chown www-data:www-data /run/php

# Configure PHP-FPM to listen on all interfaces
RUN sed -i "s/listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "--nodaemonize"]

EXPOSE 9000

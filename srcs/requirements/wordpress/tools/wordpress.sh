#!/bin/bash

# downloads the PHP Archive 
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# check if WordPress directory is correctly set up
if [ -e /var/www/html ]; then
    rm -rf /var/www/html/*
fi
mkdir -p /var/www/html

cd /var/www/html

# download WordPress
wp core download --allow-root --path=/var/www/html

# create a new wp-config.php
wp config create \
	--allow-root \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASSWORD \
	--dbhost=mariadb \
	--dbprefix=wp_

# install WordPress and create admin (change --url for VM -> albokanc.42.fr)
wp core install \
	--allow-root \
	--skip-email \
	--title=$WP_NAME \
	--url=$DOMAIN_NAME \
	--admin_user=$WP_ROOT_USER \
	--admin_password=$WP_ROOT_PASS \
	--admin_email=$WP_ROOT_MAIL

# create a 2nd user
wp user create $WP_USER $WP_USER_MAIL --role=subscriber --user_pass=$WP_USER_PASS --allow-root

# configure redis
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE true --raw --allow-root
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wp config set WP_REDIS_CLIENT phpredis --allow-root

wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root
wp redis status --allow-root

# start in the foreground mode
php-fpm -F
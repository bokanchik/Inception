#!/bin/bash

sleep 10

wp config create --allow-root \
	--dbname=$DB_DATABASE \
	--dbuser=$DB_ADMIN_USER \
	--dbpass=$DB_ADMIN_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

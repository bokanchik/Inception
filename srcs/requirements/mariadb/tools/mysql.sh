#!/bin/bash

/etc/init.d/mariadb start

sleep 5

mysql -u root -p${DB_ADMIN_PASSWORD} -e"CREATE DATABASE IF NOT EXISTS \`${DB_DATABASE}\`;"
mysql -u root -p${DB_ADMIN_PASSWORD} -e"CREATE USER IF NOT EXISTS \`${DB_ADMIN_USER}\`@'%' IDENTIFIED BY '${DB_ADMIN_PASSWORD}';"
mysql -u root -p${DB_ADMIN_PASSWORD} -e"GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO \`${DB_ADMIN_USER}\`@'%';"
mysql -u root -p${DB_ADMIN_PASSWORD} -e"FLUSH PRIVILEGES;"

# close the service
mysqladmin -u root -p${DB_ADMIN_PASSWORD} shutdown

# restart the service 
exec mysqld_safe

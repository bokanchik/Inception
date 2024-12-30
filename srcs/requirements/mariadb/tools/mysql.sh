#!/bin/bash

# Start MariaDB in the background
mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

/etc/init.d/mariadb start 

sleep 5
mysql -u root <<EOF

CREATE DATABASE \`${DB_DATABASE}\`;
CREATE USER \`${DB_ADMIN_USER}\`@'%' IDENTIFIED BY '${DB_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO \`${DB_ADMIN_USER}\`@'%';
FLUSH PRIVILEGES;


SHOW DATABASES;
SELECT User, Host FROM mysql.user;

EOF

exit
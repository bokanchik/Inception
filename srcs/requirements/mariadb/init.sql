CREATE DATABASE \`${DB_DATABASE}\`;
CREATE USER \`${DB_ADMIN_USER}\`@'%' IDENTIFIED BY '${DB_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO \`${DB_ADMIN_USER}\`@'%';
FLUSH PRIVILEGES;
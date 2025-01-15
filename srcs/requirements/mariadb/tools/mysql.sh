#!/bin/bash

set -e

export QUERY_FILE=/query.sql 

echo "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" >> $QUERY_FILE
echo "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> $QUERY_FILE
echo "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%';" >> $QUERY_FILE
echo "FLUSH PRIVILEGES;" >> $QUERY_FILE
chmod +rw $QUERY_FILE

mysqld --init-file=$QUERY_FILE
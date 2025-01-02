# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
     mariadb-server

COPY conf/my.cnf /etc/mysql/my.cnf

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

COPY tools/mysql.sh /

RUN chmod 777 ./mysql.sh

EXPOSE 3306


CMD [ "./mysql.sh" ]
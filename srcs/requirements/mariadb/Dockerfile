# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
     mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/my.cnf /etc/mysql/my.cnf

COPY init.sql /docker-entrypoint-initdb.d/

CMD ["mysqld"]
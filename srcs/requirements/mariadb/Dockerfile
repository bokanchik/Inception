# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt update
RUN apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld && chown -R root:root /var/run/mysqld

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/mysql.sh /

RUN chmod 777 ./mysql.sh

EXPOSE 3306

CMD [ "bash", "./mysql.sh" ]

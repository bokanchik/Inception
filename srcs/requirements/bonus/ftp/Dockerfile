# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y \
    vsftpd && apt-get clean

ARG FTP_USER
ARG FTP_PASSWORD

ENV FTP_USER=${FTP_USER}
ENV FTP_PASSWORD=${FTP_PASSWORD}

RUN useradd -m -d /home/ftpuser -s /bin/bash ftpuser && \
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

RUN mkdir -p /home/ftpuser/wordpress && chown -R ftpuser:ftpuser /home/ftpuser

RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

CMD /usr/sbin/vsftpd /etc/vsftpd.conf
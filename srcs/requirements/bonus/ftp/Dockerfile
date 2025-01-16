FROM debian:bullseye

RUN apt update
RUN apt install -y \
    vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf


FROM debian:bullseye

RUN apt update
RUN apt install -y \
    vsftpd ftp

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/ftp.sh .

RUN chmod +x /ftp.sh

ENTRYPOINT [ "/ftp.sh" ]
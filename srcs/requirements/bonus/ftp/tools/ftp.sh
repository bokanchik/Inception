#!/bin/bash

mkdir -p /var/run/vsftpd/empty

# create ftp_user and user's home directory
if ! id "${FTP_USER}" &>/dev/null; then
    useradd -m -d /var/www/html "${FTP_USER}"
fi

# set the password for ftp_user
echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

chown -R ${FTP_USER}:${FTP_USER} /var/www/html
chmod -R 755 /var/www/html

# start the service in the foreground
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
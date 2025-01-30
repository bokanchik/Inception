
## to find a <ftp_server_ip>

sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ftp  

## to connect via ftp_client

ftp <ftp_server_ip>

## log-in

with ftp_user + ftp_pass in .env

## download a file from wp_volumw

cd /wordpress && get wp-config.php

## to check if it was downloaded 

!pwd 
# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*
    
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl 
     
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=test.fr/UID=albokanc"


EXPOSE 443 

CMD [ "nginx", "-g", "daemon off;" ]

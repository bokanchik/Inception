# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt update
RUN apt install -y \
    nginx \
    curl \
    openssl \
    && rm -rf /var/lib/apt/lists/*
    
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl 
     
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=albokanc.42.fr/UID=albokanc"

EXPOSE 443 

CMD [ "nginx", "-g", "daemon off;" ]

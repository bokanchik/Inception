# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN  mkdir -p /etc/nginx/ssl 
     
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=albokanc.42.fr/UID=albokanc"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# for testing purpose
RUN mkdir -p /var/www/html \
 && echo "<h1>Custom Nginx Config is Working!</h1>" > /var/www/html/index.html && \
 chown -R www-data:www-data /var/www/html && \
 chmod -R 755 /var/www/html

# listen only on 443 port
EXPOSE 443 

CMD [ "nginx", "-g", "daemon off;" ]
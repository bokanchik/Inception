FROM debian:bullseye

RUN apt update
RUN apt install -y \
    redis-server \
    php-redis

COPY ./tools/redis.sh /tmp/redis.sh
RUN chmod +x /tmp/redis.sh

EXPOSE 6379

CMD ["sh", "/tmp/redis.sh"]


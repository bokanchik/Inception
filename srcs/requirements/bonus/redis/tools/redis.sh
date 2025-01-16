#!/bin/bash

# check if redis.conf exists 
if [ -f "/etc/redis/redis.conf" ]; then
    # allow to accept connections from other network interfaces
    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
    # set memory to 256mb
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
    # set memory policy
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf
    
    echo "Redis configuration updated successfully."

fi

# accept network connections from any IP (not just localhost)
redis-server --protected-mode no
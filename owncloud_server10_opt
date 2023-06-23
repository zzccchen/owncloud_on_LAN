#!/bin/bash

# Memory Caching
apt install redis-server -y
apt install memcached php7.4-memcached -y
usermod -G redis -a www-data
mkdir -p /var/run/redis/
chown -R redis:www-data /var/run/redis
echo "unixsocket /var/run/redis/redis.sock" | tee -a /etc/redis/redis.conf
echo "unixsocketperm 770" | tee -a /etc/redis/redis.conf
service redis-server restart
sed -i "/'installed' => true,/a\
  'filelocking.enabled' => true,\\
  'memcache.local' => '\\\OC\\\Memcache\\\Redis',\\
  'memcache.locking' => '\\\OC\\\Memcache\\\Redis',\\
  'redis' => [\\
    'host' => '/var/run/redis/redis.sock',\\
    'port' => 0,\\
  ]," /var/www/owncloud/config/config.php

# Transparent Huge Pages
sudo echo never > sudo /sys/kernel/mm/transparent_hugepage/enabled
systemctl restart apache2

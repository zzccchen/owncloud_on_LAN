#!/bin/bash

apt update  # To get the latest package lists
apt install mariadb-server -y
apt install curl gnupg2 -y

# sudo add-apt-repository ppa:ondrej/php
echo "deb https://ppa.launchpadcontent.net/ondrej/php/ubuntu jammy main" | tee -a /etc/apt/sources.list
echo "#deb-src https://ppa.launchpadcontent.net/ondrej/php/ubuntu jammy main " | tee -a /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C

apt update
sudo apt install php7.4 php7.4-intl php7.4-mysql php7.4-mbstring \
       php7.4-imagick php7.4-igbinary php7.4-gmp php7.4-bcmath \
       php7.4-curl php7.4-gd php7.4-zip php7.4-imap php7.4-ldap \
       php7.4-bz2 php7.4-ssh2 php7.4-common php7.4-json \
       php7.4-xml php7.4-dev php7.4-apcu php7.4-redis \
       libsmbclient-dev php-pear php-phpseclib -y
apt install libapache2-mod-php7.4 apache2 -y

echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/server:/10/Ubuntu_22.04/ /' > /etc/apt/sources.list.d/isv:ownCloud:server:10.list
curl -fsSL https://download.opensuse.org/repositories/isv:ownCloud:server:10/Ubuntu_22.04/Release.key | gpg --dearmor > /etc/apt/trusted.gpg.d/isv_ownCloud_server_10.gpg
apt update
apt install owncloud-complete-files -y

mkdir /var/www/owncloud
cat > /etc/apache2/sites-available/owncloud.conf << 'EOL'
Alias / "/var/www/owncloud/"

<Directory /var/www/owncloud/>
  Options +FollowSymlinks
  AllowOverride All

 <IfModule mod_dav.c>
  Dav off
 </IfModule>

 SetEnv HOME /var/www/owncloud
 SetEnv HTTP_HOME /var/www/owncloud

</Directory>
EOL

a2ensite owncloud.conf
a2dissite 000-default.conf
a2enmod rewrite mime unique_id
apachectl -t
systemctl restart apache2

mysql --password=zzccchen1234 --user=root --host=localhost << eof
create database ownclouddb;
grant all privileges on ownclouddb.* to root@localhost identified by "zzccchen1234";
flush privileges;
exit;
eof

cd /var/www/owncloud
sudo -u www-data php occ maintenance:install \
   --database "mysql" \
   --database-name "ownclouddb" \
   --database-user "root"\
   --database-pass "zzccchen1234" \
   --admin-user "root" \
   --admin-pass "zzccchen1234"

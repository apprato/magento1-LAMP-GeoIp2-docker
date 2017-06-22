#!/bin/bash

# Download and Install GeoIP2 City Database
cd /usr/local/src/
wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz
# mkdir /usr/local/src/GeoLite2-City
tar -xf GeoLite2-City.tar.gz
mkdir /usr/local/share/GeoIP
mv /usr/local/src/GeoLite2-City_20170606/GeoLite2-City.mmdb /usr/local/share/GeoIP


# Download and Install GeoIP2 City Database
cd /usr/local/src/
wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz
# mkdir /usr/local/src/GeoLite2-Country
tar -xf GeoLite2-Country.tar.gz
mv /usr/local/src/GeoLite2-Country_20170606/GeoLite2-Country.mmdb /usr/local/share/GeoIP

# Install composer
cd /usr/local/src/
curl -sS https://getcomposer.org/installer | php
cp composer.phar /usr/local/bin
echo '{  "require": { "geoip2/geoip2": "0.6.*" } }' >> composer.json
php composer.phar install

# Install C Library libmaxmind
cd /usr/local/src/
git clone --recursive https://github.com/maxmind/libmaxminddb
cd libmaxminddb
./bootstrap
./configure
# make check
make install
ldconfig


# Install & Configure PHP C Extension
cd /usr/local/src/vendor/maxmind-db/reader
cd ext
phpize
./configure
make
# make test
make install
printf "\nextension=maxminddb.so" >> /etc/php.ini


# update the dynamic links for libmaxminddb
ldconfig /usr/local/lib

# service httpd restart  This will need to be run at some time to create the dynamic links


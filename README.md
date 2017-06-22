## Magento 1 Dockerized LAMP Stack with Maxmind GeoIP2 Database and PHP API installed

# Containers

* Apache
* PHP / PHP 5.6
* MariaDB
* Redis
* GeoIP2 / Maxmind GeoIP2


# Install 
The docker-compose.yml installs a LAMP Stack with PHP CGI which was a replica of an environment I was required to make
for some support work.  Usually I prefer nGinx over Apache

 - Clone out this repository
 - Add your files to /www
 - Add you local.xml to www/app/etc/local.xml
 - sudo printf "\n127.0.0.1 magento.dev" >> /etc/hosts  (Add URL to /etc/hosts)
 - Connect to your db with a client or similar and upload our database (MariaDb Connenct) if you don't want to install from scratch
 - cd into directory & run: docker-compose up -d

# MariaDB Credentials
host: 127.0.0.1
user: magento
password: magento
database: magento

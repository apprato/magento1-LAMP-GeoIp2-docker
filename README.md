# Magento 1 Dockerized LAMP Stack with Maxmind GeoIP2 Database and PHP API installed

## Containers

* Apache
* PHP / PHP 5.6
* MariaDB
* Redis
* GeoIP2 / Maxmind GeoIP2


## Install 
The docker-compose.yml installs a LAMP Stack with PHP CGI which was a replica of an environment I was required to make
for some support work.  Usually I prefer nGinx over Apache

### Boot up the stack
Clone out the stack git clone ...
docker-compose up -d
Add your files to /www
Add your local.xml to www/app/etc/local.xml

### Add URL to your hosts file
sudo printf "\n127.0.0.1 magento.dev" >> /etc/hosts  (Add URL to /etc/hosts)

### Install Maxmind GeoIP2 Database and PHP API
docker exec -it <NAME OF APACHE CONTAINER> bash
cd /
sh setup-maxmind_geoip2.sh

### Import your DB
Connect to your db with a client or similar and upload our database.  
Please see MariaDb Connenct for more details. 

### MariaDB Credentials
host: 127.0.0.1
user: magento
password: magento
database: magento


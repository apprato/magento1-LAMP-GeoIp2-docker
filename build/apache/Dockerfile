# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Scott Collier" <scollier@redhat.com>

FROM centos:centos6
MAINTAINER The CentOS Project <cloud-ops@centos.org>

# Get Repos (Epel etc)
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

# Install Misc
RUN yum -y update; yum clean all
RUN yum -y install vim
RUN yum -y install httpd; yum clean all
RUN echo "Apache HTTPD" >> /var/www/html/index.html
RUN yum -y install httpd-devel
RUN yum -y install tmux

# Install PHP LIbraries
RUN yum -y install php56w
RUN yum -y install php56w-cli
RUN yum -y install php56w-common
# The above provides: php-api, php-bz2, php-calendar, php-ctype, php-curl, php-date, php-ereg, php-exif, php-fileinfo, php-filter, php-ftp, php-gettext, php-gmp, php-hash, php-iconv, php-json, php-libxml, php-openssl, php-pcre, php-pecl-Fileinfo, php-pecl-phar, php-pecl-zip, php-reflection, php-session, php-shmop, php-simplexml, php-sockets, php-spl, php-tokenizer, php-zend-abi, php-zip, php-zlib
RUN yum -y install php56w-xml
RUN yum -y install php56w-mysql
RUN yum -y install php56w-mcrypt
RUN yum -y install php56w-soap
RUN yum -y install php56w-gd
RUN yum -y install php56w-bcmath
RUN yum -y install php56w-devel

# Install Misc
RUN yum -y install git
RUN yum -y install gcc gcc-c++
RUN yum -y groupinstall "Development Tools"
RUN yum -y install wget
RUN yum -y install links
RUN yum install -y zsh
RUN yum install -y telnet


EXPOSE 80

# Add Install scripts to: Start Apache, Install Geomind
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
ADD setup-maxmind_geoip2.sh /setup-maxmind_geoip2.sh
RUN chmod -v +x /setup-maxmind_geoip2.sh

CMD ["/run-httpd.sh"]
# CMD ["/setup-maxmind_geoip2.sh"]












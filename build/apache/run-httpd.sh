#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.

# Configure run apache
chmod -v +x /run-httpd.sh
chown apache:apache /var/www/cgi-bin/php.fastcgi
chmod +x /var/www/cgi-bin/php.fastcgi
rm -rf /run/httpd/*
exec /usr/sbin/apachectl -D FOREGROUND



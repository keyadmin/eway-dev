#!/bin/sh

set -e

echo "Starting the nginx -php daemon"
service php7.4-fpm start

nginx -g 'daemon off;'

sed -i 's/database_name_here/wordpress/g' /var/www/wordpress/wp-config-sample.php
sed -i 's/username_here/kiennt1/g' /var/www/wordpress/wp-config-sample.php
sed -i 's/password_here/caoml@2020/g' /var/www/wordpress/wp-config-sample.php

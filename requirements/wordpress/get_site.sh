#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=arguez.42.fr --title=inception --admin_user=$ADMINUSR --admin_password=$ADMINPASSWD --admin_email=$ADMINEMAIL --allow-root

php-fpm7.4 -F

#!/bin/bash
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[0m'

if [[ ! -f ./wp-cli.phar ]]; then
  cd /var/www/html
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
else
  echo "${YELLOW}wp-cli bin detected, skipping creation...${WHITE}"
fi

if [[ ! -f ./wp-config.php ]]; then
  ./wp-cli.phar core download --allow-root
  ./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
  ./wp-cli.phar core install --url=arguez.42.fr --title=inception --admin_user=$ADMINUSR --admin_password=$ADMINPASSWD --admin_email=$ADMINEMAIL --allow-root
  ./wp-cli.phar user create $USR $USREMAIL --role=author --user_pass=$PASSWD --allow-root
else
  echo "${YELLOW}Wordpress config detected, skipping creation...${WHITE}"
fi

echo "${GREEN}Wordpress setup complete!${WHITE}"

php-fpm7.4 -F

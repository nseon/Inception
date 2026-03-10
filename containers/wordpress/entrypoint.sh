#!/bin/sh

cd /usr/share/webapps/wordpress

if [ ! -f "wp-config.php" ]; then
    DB_PWD=$(cat /run/secrets/db_password)
    
    cp wp-config-sample.php wp-config.php
    
    sed -i "s|database_name_here|$MYSQL_DATABASE|g" wp-config.php
    sed -i "s|username_here|$MYSQL_USER|g" wp-config.php
    sed -i "s|password_here|$DB_PWD|g" wp-config.php
    sed -i "s|localhost|mariadb|g" wp-config.php
fi
exec php-fpm83 -F

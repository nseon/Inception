#!/bin/sh

cd /usr/share/webapps/wordpress

if [ ! -f "wp-config.php" ]; then
    DB_PWD=$(cat /run/secrets/db_password)
    admin_user=$(sed '1!d' /run/secrets/wp_admin)
    admin_passwd=$(sed '2!d' /run/secrets/wp_admin)
    admin_mail=$(sed '3!d' /run/secrets/wp_admin)
	wp_user=$(sed '1!d' /run/secrets/wp_user)
    wp_passwd=$(sed '2!d' /run/secrets/wp_user)
    wp_mail=$(sed '3!d' /run/secrets/wp_user)
    
    cp wp-config-sample.php wp-config.php
    
    sed -i "s|database_name_here|$MYSQL_DATABASE|g" wp-config.php
    sed -i "s|username_here|$MYSQL_USER|g" wp-config.php
    sed -i "s|password_here|$DB_PWD|g" wp-config.php
    sed -i "s|localhost|mariadb|g" wp-config.php
fi

if ! wp core is-installed; then
    wp core install \
    --url=nseon.42.fr \
    --title="Inception" \
    --admin_user=$admin_user \
    --admin_password=$admin_passwd \
    --admin_email=$admin_mail \
    --skip-email \
    --allow-root
    
    wp user create $WP_USER $WP_USER_EMAIL \
    --role=author \
    --user_pass=$WP_USER_PWD \
    --allow-root
fi

exec php-fpm83 -F

#!/bin/bash

sleep 5

# Download do wordpress para o /var/www/html
if [ ! -f "/var/www/html/wp-config.php" ]; then
	if cd /var/www/html && wp core download --allow-root

	then
	wp config create --allow-root \
		--path=/var/www/html/ \
		--dbname=$DB_NAME \
		--dbuser=$DB_ADMIN \
		--dbpass=$DB_PASS \
		--dbhost=$DB_HOST \
		&& \
		wp core install \
		--allow-root \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_EMAIL \
		--url=$WP_URL \
		&& \
		wp user create \
		--allow-root \
		$WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS
	fi
fi

exec "$@"

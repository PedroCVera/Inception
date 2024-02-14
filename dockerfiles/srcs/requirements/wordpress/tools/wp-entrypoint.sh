#!/bin/bash

if [ -d "/var/www/html/wordpress/wp-admin" ]; then
	echo "Wordpress already installed"
else
	echo "Wordpress installation"
	wget -q -O /tmp/wordpress.tar.gz https://wordpress.org/wordpress-6.1.3.tar.gz

	tar -xzf /tmp/wordpress.tar.gz -C /tmp

	mkdir -p /var/www/html/wordpress

	mv /tmp/wordpress/* /var/www/html/wordpress

fi

chown -R www-data.www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

service php7.4-fpm start

sleep 2

wget -q -O /usr/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/bin/wp

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
	echo "Wordpress already configured"
else

	echo "Wordpress configuration"

	wp --allow-root --path=/var/www/html/wordpress core config --dbhost=rdas-nev_mariadb --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --url=$DOMAIN_NAME
fi

service php7.4-fpm stop

exec "$@"

#!/bin/sh
echo "hALOOOOOOOOOOOOOOOOOOOOOOO"

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

service mysql start

sleep 1

mysql_secure_installation << END

Y
$DB_ROOT_PASSWORD
$DB_ROOT_PASSWORD
Y
Y
Y
Y
END

    mysql -u root -e "CREATE DATABASE $DB_NAME;"
    mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
    mysql -u root -p$DB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

else
    sleep 1
fi

echo "Done"

exec "$@"

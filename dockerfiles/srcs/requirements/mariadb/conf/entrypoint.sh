#!/bin/sh
echo "hALOOOOOOOOOOOOOOOOOOOOOOO"

if [ ! -d "/var/lib/mysql/$MDB_NAME" ]; then

service mariadb start

sleep 1

mysql_secure_installation << END

Y
$MDB_ROOT_PASSWORD
$MDB_ROOT_PASSWORD
Y
Y
Y
Y
END

mysql -u root -e "CREATE DATABASE $DB_NAME;"
mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
mysql -u root -p$DB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

else
    sleep 1
fi

echo "Done"

exec "$@"

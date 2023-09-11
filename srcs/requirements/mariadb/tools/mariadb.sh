#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

if [ -d "/var/lib/msyql/$MYSQL_DATABASE" ]
then
    echo "Database already exists"
else 
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root
mysql -uroot -p $MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop
exec "$@"
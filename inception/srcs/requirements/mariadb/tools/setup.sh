#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql"]; then #initialiser /var/lib/mysql par les tablaux de systeme qui disent au MD comment gerer data
    echo "[mariadb] initialzing data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

else
    echo "DATABASE EXISTS"
fi

echo "[mariadb] starting..."

mysqld_safe &

until mysqladmin ping -h 127.0.0.1 --silent; do
    sleep 1
done

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

exec mysqld_safe 

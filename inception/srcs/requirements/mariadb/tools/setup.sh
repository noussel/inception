#!/bin/bash
# 1. démarrer MariaDB
# 2. créer la base wordpress
# 3. créer wpuser
# 4. donner les privilèges
# 5. arrêter MariaDB
# 6. lancer mysqld


if [ ! -d "/var/lib/mysql/mysql"]; then #initialiser /var/lib/mysql
    echo "[mariadb] initialzing data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

echo "[mariadb] starting..."

mysqld_safe &

until mysqladmin ping -h 127.0.0.1 --silent; do
    echo "Waiting MariaDB..."
    sleep 1
done

echo "[mariadb] creating db..."

mysql -e  "
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO 'wpuser'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
"

mysqladmin -u root shutdown

exec mysqld

#continue running mysqld in the foreground bach maywlich stoped hit script (main process) sala 

# my.cnf
#    |
#    +--> kifach MariaDB kat9bel connexions

# setup.sh
#    |
#    +--> ach ghadi ytsayeb f database

# Dockerfile
#    |
#    +--> install MariaDB w yjib had les fichiers
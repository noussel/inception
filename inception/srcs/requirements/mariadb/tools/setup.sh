#!/bin/bash
# 1. démarrer MariaDB
# 2. créer la base wordpress
# 3. créer wpuser
# 4. donner les privilèges
# 5. arrêter MariaDB
# 6. lancer mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "FIRST START"
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
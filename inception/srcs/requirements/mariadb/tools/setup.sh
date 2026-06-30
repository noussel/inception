#!/bin/bash
# 1. démarrer MariaDB
# 2. créer la base wordpress
# 3. créer wpuser
# 4. donner les privilèges
# 5. arrêter MariaDB
# 6. lancer mysqld


mysqld_safe &

sleep 5

mysql -e  "
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO 'wpuser'@'%';
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
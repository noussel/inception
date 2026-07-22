# installer php-fpm (not in the script because it should be installed at the creation of the image)
# installer les extensions PHP nécessaires

# télécharger WordPress
# créer wp-config.php
# lancer php-fpm

mkdir -p /var/www/html #creation du fichier du site web 
cd /var/www/html # Hit wp config create w wp core install khas-hom ykhdmo mn dak dossier li fih :
#apres extraction depuis wordpress www/html doit contien ├── wp-admin├── wp-content├── wp-includes

if [ ! -f wp-config.php ]; then

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp


wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

cp -r wordpress/* /var/www/html/ #kanhet dakchi dyal wordpress f dossier dyal site 

rm -rf wordpress latest.tar.gz

    # until mysql -h mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1" 2>/dev/null; do
    until mysql -h mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1"; do
        sleep 2
    done

    #creation d'un ficher wp-config.php contien : name ,user ...
    wp config create \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb \
        --allow-root #allow l'execution des commandes avec root user
    #host = mariadb : connecte toi au service mariadb

    wp core install \
        --url=https://$DOMAIN_NAME \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --allow-root

    wp user create \
        $WP_USER \
        $WP_USER_EMAIL \
        --user_pass=$WP_USER_PASSWORD \
        --role=author \
        --allow-root
fi

mkdir -p /run/php
exec php-fpm7.4 -F #exec : bdel had script lihwa main process l process akhr lihwa php-fpm
# PHP-FPM howa li kayexecuti les fichiers PHP dyal WordPress.
# Nginx kaysift lih les requêtes PHP.

# /var/www/html/
# ├── index.php              <- le point d'entrée principal du site
# ├── wp-config.php          <- contient les identifiants de connexion à MariaDB
# ├── wp-login.php           <- la page de connexion admin
# ├── wp-load.php
# ├── wp-admin/
# │   ├── index.php          <- le tableau de bord admin
# │   ├── edit.php
# │   └── ... (des centaines de fichiers .php)
# ├── wp-includes/
# │   ├── functions.php      <- des fonctions PHP réutilisées partout
# │   ├── class-wp.php
# │   └── ... (le "moteur" de WordPress, en PHP)
# └── wp-content/
#     ├── themes/             <- l'apparence du site (fichiers .php aussi)
#     ├── plugins/
#     └── uploads/            <- images que tu uploades depuis l'admin
#! /bin/bash

# créer dossiers SSL

# créer certificat SSL

# lancer nginx


#nginx kay3ref l'emplacement de ces fichers par config file
mkdir -p /etc/ssl/private
mkdir -p /etc/ssl/certs

#openssl : programme de securite 
#req : creer une req d'une sertificat
#-x509 : Self-signed certificate : sertica va etre formuler par moi non pas importee depuis l'internet
#nodes : nginx maghayhatch un pasword pour acceder au key chaque demarage
#nekey : create new 
openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/server.key \
    -out /etc/ssl/certs/server.crt \
    -subj "/C=MA/ST=Casablanca/L=Casablanca/O=42/OU=42/CN=$DOMAIN_NAME"

exec nginx -g "daemon off;"
FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/sites-available/default
#Nginx 3ando configuration par défaut.
# Nta katbddlha b configuration dyalk.
COPY tools/setup.sh /

RUN chmod +x /setup.sh

EXPOSE 443

ENTRYPOINT ["/setup.sh"]

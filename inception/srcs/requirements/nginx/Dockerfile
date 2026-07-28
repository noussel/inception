FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/sites-available/default

COPY tools/setup.sh /

RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]

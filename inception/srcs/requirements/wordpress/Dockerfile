# php-fpm
# php-mysql
# wget
# curl

FROM debian:bullseye

RUN apt update && apt install -y wordpress

COPY tools/setup.sh /
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["bash", "setup.sh"]


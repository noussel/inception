# 1. Install php-fpm
# 2. Install php-mysql
# 3. Install wget
# 4. Copy www.conf
# 5. Copy setup.sh
# 6. chmod +x setup.sh
# 7. ENTRYPOINT setup.sh

FROM debian:bullseye

# RUN apt update && apt install php-fpm php-mysql wget -y

RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    mariadb-client \
    wget

    #mariadb-client fih mysqladmin list3mlt f waiting loop 

COPY tools/setup.sh /
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf



ENTRYPOINT ["bash", "/setup.sh"]


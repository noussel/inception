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
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*
    #mariadb-client fih mysqladmin list3mlt f waiting loop 

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' \
    /etc/php/7.4/fpm/pool.d/www.conf


WORKDIR /var/www/html

COPY tools/setup.sh /
# COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["bash", "/setup.sh"]


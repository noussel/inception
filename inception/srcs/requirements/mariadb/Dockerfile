FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

COPY tools/script.sh / 
COPY conf/my.cnf /etc/mysql/conf.d/my.cnf

RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]

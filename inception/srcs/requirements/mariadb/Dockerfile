FROM debian:bullseye

RUN apt update && apt install -y mariadb-server 

COPY tools/setup.sh /
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
#check if /etc/mysql/conf.d/my.cnf is the path in the machine 

RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]

FROM ubuntu:latest

WORKDIR /home

RUN apt-get update \
    && apt-get install -y mysql-server \
    && apt-get install nano \
    && rm -rf /var/lib/apt/list/* \
    && apt-get purge --autoremove \
    && apt-get clean

RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf

VOLUME ["/var/lib/mysql"]
 
EXPOSE 3306
 
CMD service mysql start && tail -F /var/log/mysql/error.log


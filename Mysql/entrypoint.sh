#!/bin/sh

set -e
echo "mysql starting"
service mysql start
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'kiennt1'@'localhost' IDENTIFIED BY 'caoml@2020';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress . * TO 'kiennt1'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "DROP USER 'root'@'localhost';"
#mysql -u kiennt1 -pcaoml@2020

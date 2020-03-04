#!/bin/bash
yum -y install gcc openssl-devel pcre-devel
tar -xf  lnmp_soft.tar.gz
cd lnmp_soft
tar -xf  nginx-1.12.2.tar.gz
cd nginx-1.12.2/
./configure --with-http_ssl_module  &> /dev/null 
make && make install  &> /dev/null
yum -y install php php-mysql php-fpm
yum -y install mariadb mariadb-server mariadb-devel
/usr/local/nginx/sbin/nginx
systemctl restart php-fpm
systemctl restart mariadb
ss -anutp | grep nginx
ss -anutp | grep php
ss -anutp | grep :3306

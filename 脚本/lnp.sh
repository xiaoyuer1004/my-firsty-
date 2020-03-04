#!/bin/bash
yum -y install gcc openssl-devel pcre-devel
cd nginx-1.12.2/
./configure &> /dev/null 
make && make install  &> /dev/null
yum -y install php php-mysql php-fpm
/usr/local/nginx/sbin/nginx
systemctl restart php-fpm
ss -anutp | grep nginx
ss -anutp | grep php

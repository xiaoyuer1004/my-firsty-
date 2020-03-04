#!/bin/bash
yum -y install unzip
cd lnmp_soft
unzip wordpress.zip
cd wordpress
tar -xf wordpress-5.0.3-zh_CN.tar.gz
cp -r wordpress/*  /usr/local/nginx/html/
chown -R apache:apache  /usr/local/nginx/html/

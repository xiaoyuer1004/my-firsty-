#!/bin/bash
echo '/dev/sr0  /mnt iso9660 defaults 0 0'  >> /etc/fstab
mount -a 
mkdir /etc/yum.repos.d/repo
mv /etc/yum.repos.d/*.repo  /etc/yum.repos.d/repo
echo "[local]
name=local
baseurl=file:///mnt
enabled=1
gpgcheck=0"  >  /etc/yum.repos.d/local.repo
yum repolist
yum -y install vim 
yum -y install bash-completion

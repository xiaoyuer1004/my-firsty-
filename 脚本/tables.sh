#!/bin/bash
firewall-cmd --set-default-zone=trusted
setenforce 0 &&    sed -i  's/SELINUX=enforcing/SELINUX=permissive/g'  /etc/selinux/config


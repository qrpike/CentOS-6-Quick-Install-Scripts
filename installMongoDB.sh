#!/bin/bash

clear
echo 'Going to install MongoDB for ya... you NoSQL groupie!!...'

echo '[10gen]' >> /etc/yum.repos.d/10gen.repo
echo 'name=10gen Repository' >> /etc/yum.repos.d/10gen.repo
echo 'baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64' >> /etc/yum.repos.d/10gen.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/10gen.repo
echo 'enabled=1' >> /etc/yum.repos.d/10gen.repo

yum install -y mongo-10gen mongo-10gen-server

service mongod start
chkconfig mongod on
clear
echo 'MongoDB is installed, running and set to auto-start on reboots.... your still a NoSQL groupie...'
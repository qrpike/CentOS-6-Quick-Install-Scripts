#!/bin/bash

clear
echo 'Going to install MongoDB for ya... you NoSQL groupie!!...'

echo '[10gen]' >> /etc/yum.repos.d/10gen.repo
echo 'name=10gen Repository' >> /etc/yum.repos.d/10gen.repo
echo 'baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64' >> /etc/yum.repos.d/10gen.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/10gen.repo
echo 'enabled=1' >> /etc/yum.repos.d/10gen.repo

yum install -y mongo-10gen mongo-10gen-server

echo 'Begin to config MongoDB...'
read -p 'Enter path to save config : (/etc/mongod.conf) ' config
config=${config:-/etc/mongod.conf}
touch $config
read -p 'Enter path to save data : (/data/db) ' dbpath
dbpath=${dbpath:-/data/db}
echo 'dbpath = '$dbpath >> $config
read -p 'Enter path to save log : (/var/log/mongodb/mongod.log) ' logpath
logpath=${logpath:-/var/log/mongodb/mongod.log}
echo 'logpath = '$logpath >> $config
echo 'fork = true' >> $config
echo 'port = 27017' >> $config
echo 'bind_ip = 127.0.0.1' >> $config
echo 'logappend = true' >> $config

service mongod --config $config
chkconfig mongod on
clear
echo 'MongoDB is installed, running and set to auto-start on reboots.... your still a NoSQL groupie...'

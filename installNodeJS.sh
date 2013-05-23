#!/bin/bash

cd ~/

# install NTP just incase:
# - NodeJS throws an error if you try to compile with a server date before the NodeJS release date
source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installNTP.sh --insecure)

yum install -y wget

wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm


yum install -y nodejs


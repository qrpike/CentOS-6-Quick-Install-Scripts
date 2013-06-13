#!/bin/bash

# install NTP just incase:
# - NodeJS throws an error if you try to compile with a server date before the NodeJS release date
source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installNTP.sh --insecure)

# CHANGE THIS URL FOR DIFF VERSIONS :::
# -----------------------------------------------------

JSURL=http://nodejs.org/dist/node-latest.tar.gz

# ----------------------------------------------------- 

clear

echo 'We are going to install NodeJS for you... '

echo 'checking if we got wget magic'
yum install -y wget #check if we have it

echo 'lets download nodejs..'

rm -r -f /usr/local/src
mkdir -p /usr/local/src
cd /usr/local/src

wget $JSURL

mkdir -p ./nodesrc
cd ./nodesrc
tar -zxvf ./node-latest.tar.gz

echo 'Files extracted....'

cd ./node-latest.tar.gz

yum install -y openssl-devel gcc-c++ make git

echo 'Configuring and installing NodeJS'

./configure
make
make install

echo 'welllllll....... that should be it.... hopefully :)'

clear

echo "Node is now installed @ version:"
node --version


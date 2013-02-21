#!/bin/bash

#install NTP just incase:
source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installNTP.sh --insecure)

# CHANGE THIS URL FOR DIFF VERSIONS :::
# -----------------------------------------------------

JSURL=http://nodejs.org/dist/v0.8.18/node-v0.8.18.tar.gz

# -----------------------------------------------------

FILENAME=${JSURL##*/} # get the filename from the URL
TEMPFOLDER="${FILENAME%.*}"
FOLDER="${TEMPFOLDER%.*}"

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
tar -zxvf ./$FILENAME

echo 'Files extracted....'

cd ./$FOLDER

yum install -y openssl-devel
yum groupinstall -y "Development Tools"

echo 'Configuring and installing NodeJS'

./configure
make
make install

echo 'welllllll....... that should be it.... hopefully :)'

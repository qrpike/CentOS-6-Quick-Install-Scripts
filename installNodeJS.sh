#!/bin/bash

# CHANGE THIS URL FOR DIFF VERSIONS :::
# -----------------------------------------------------

JSURL=http://nodejs.org/dist/node-latest.tar.gz

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

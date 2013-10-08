#!/bin/bash

yum install -y wget
cd
wget https://raw.github.com/isaacs/nave/master/nave.sh
chmod +x nave.sh
./nave.sh install stable
./nave.sh use stable

clear
echo "You now have NodeJS Installed @ version:"
node -v
echo "You also have Nave, just run: nave install 0.8.15 - to install nodejs version 0.8.15"

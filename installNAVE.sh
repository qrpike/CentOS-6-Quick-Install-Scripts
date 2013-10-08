#!/bin/bash

yum install -y wget
cd /usr/local/bin/
wget https://raw.github.com/isaacs/nave/master/nave.sh
mv nave.sh nave
chmod +x nave
nave install latest

clear
echo "You now have NodeJS Installed @ version:"
node -v
echo "You also have Nave, just run: nave install 0.8.15 - to install nodejs version 0.8.15"

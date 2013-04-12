#!/bin/bash
yum install git -y
git clone git://github.com/creationix/nvm.git ~/nvm
echo "source ~/nvm/nvm.sh" >> ~/.bashrc
source ~/.bashrc 
read -p 'Enter node.js version to install : (0.10.2) ' version
version=${version:-0.10.2}
nvm install $version

echo 'Have fun with Node.js'
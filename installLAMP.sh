#!/bin/bash

clear

echo 'Going to install the LAMP stack on your machine, here we go...'
echo '------------------------'
read -p "MySQL Password: " mysqlPassword
read -p "Retype password: " mysqlPasswordRetype

yum install -y httpd php mysql mysql-server

chkconfig mysql-server on
chkconfig httpd on

/etc/init.d/mysqld restart

while [[ "$mysqlPassword" = "" && "$mysqlPassword" != "$mysqlPasswordRetype" ]]; do
  echo -n "Please enter the desired mysql root password: "
  stty -echo
  read -r mysqlPassword
  echo
  echo -n "Retype password: "
  read -r mysqlPasswordRetype
  stty echo
  echo
  if [ "$mysqlPassword" != "$mysqlPasswordRetype" ]; then
    echo "Passwords do not match!"
  fi
done

/usr/bin/mysqladmin -u root password $mysqlPassword


clear
echo 'Okay.... apache, php and mysql is installed, running and set to your desired password'

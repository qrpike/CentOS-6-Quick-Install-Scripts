#!/bin/bash

echo 'Choose timezone:'
ls /usr/share/zoneinfo/
read -p 'Enter zoneinfo to set (Hongkong)' zoneinfo
zoneinfo=${zoneinfo:-Hongkong}
rm /etc/localtime
ln -s /usr/share/zoneinfo/$zoneinfo /etc/localtime

echo 'Installing and configuring NTP'

yum install -y wget ntp
chkconfig ntpd on
ntpdate pool.ntp.org
/etc/init.d/ntpd start

echo 'NTP is setup and configured'
echo 'Below should be the correct date:'
date

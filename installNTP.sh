#!/bin/bash

echo 'installing and configuring NTP'

yum install -y wget ntp
chkconfig ntpd on
ntpdate pool.ntp.org
/etc/init.d/ntpd start


# Set timezone
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime


echo 'NTP is setup and configured'
echo 'Below should be the correct date:'
date


sed -i 's/centos.pool.ntp.org/pool.ntp.org iburst/g' /etc/ntp.conf

# Add a time message on SSH logins:
cat >>~/.bashrc <<EOL
echo '--------------------------'
echo "Current Time:"
date
echo '--------------------------'
EOL

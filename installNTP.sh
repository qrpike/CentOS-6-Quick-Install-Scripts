#!/bin/bash

echo 'installing and configuring NTP'

yum install -y wget ntp
chkconfig ntpd on
ntpdate pool.ntp.org
/etc/init.d/ntpd start

echo 'NTP is setup and configured'
echo 'Below should be the correct date:'
date


# Add a time message on SSH logins:
cat >>~/.bashrc <<EOL
echo '--------------------------'
echo "Current Time:"
date
echo '--------------------------'
EOL

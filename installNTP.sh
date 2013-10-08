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

# Replace centos pool with regular NTP pool
sed -i 's/centos.pool.ntp.org/pool.ntp.org iburst/g' /etc/ntp.conf

# Add this to not fail on big time gaps ( VMs that resume/pause )
echo "tinker panic 0" >> /etc/ntp.conf 

# Create a script to update time. 
cat >/usr/bin/updatetime <<EOL
/etc/init.d/ntpd stop
ntpdate pool.ntp.org
/etc/init.d/ntpd start
EOL

# now we can just run "updatetime" to restart and sync time servers:
chmod +x /usr/bin/updatetime

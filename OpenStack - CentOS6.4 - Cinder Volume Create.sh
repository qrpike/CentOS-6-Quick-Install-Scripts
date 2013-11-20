dd if=/dev/zero of=cinder-volumes bs=1 count=0 seek=2G
losetup /dev/loop2 /var/lib/cinder/cinder-volumes
fdisk /dev/loop2



Add to /etc/rc.local

# losetup -f /var/lib/cinder/cinder-volumes && vgchange -a y cinder-volumes && service openstack-cinder-volume restart




CHANGE NETWORK NAMES:


cp /etc/grub.conf /etc/grub.conf.bak
echo "biosdevname=0" >> /etc/grub.conf
mv /etc/sysconfig/network-scripts/ifcfg-em1 /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i 's/em1/eth0/g' /etc/sysconfig/network-scripts/ifcfg-eth0
mv /etc/sysconfig/network-scripts/ifcfg-em2 /etc/sysconfig/network-scripts/ifcfg-eth1
sed -i 's/em2/eth1/g' /etc/sysconfig/network-scripts/ifcfg-eth1
rm /etc/udev/rules.d/70-persistent-net.rules
echo "MUST REBOOT TO TAKE EFFECT"







https://github.com/cloudbase/unattended-setup-scripts/blob/master/configure-rdo.sh
https://github.com/marafa/openstack/blob/master/openstack-outside.sh
http://openstack.redhat.com/Neutron_with_existing_external_network
http://openstack.redhat.com/GettingStartedHavana_w_GRE


dd if=/dev/zero of=cinder-volumes bs=1 count=0 seek=2G
losetup /dev/loop2 /var/lib/cinder/cinder-volumes
fdisk /dev/loop2



Add to /etc/rc.local

# losetup -f /var/lib/cinder/cinder-volumes && vgchange -a y cinder-volumes && service openstack-cinder-volume restart


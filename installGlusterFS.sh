#!/bin/bash

clear
echo 'Installing GlusterFS'

yum install -y wget
wget -P /etc/yum.repos.d http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/glusterfs-epel.repo
yum install -y glusterfs{-fuse,-server}

echo 'GlusterFS should be installed'
gluster peer status

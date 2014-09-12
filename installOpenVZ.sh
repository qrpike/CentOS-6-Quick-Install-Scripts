#!/bin/bash
# run: source <(curl -s https://raw.githubusercontent.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installOpenVZ.sh)


clear
echo 'Going to install OpenVZ for you..'

echo 'installing wget..'
yum install -y wget

echo 'now adding openvz Repo'
wget -P /etc/yum.repos.d/ http://ftp.openvz.org/openvz.repo
rpm --import http://ftp.openvz.org/RPM-GPG-Key-OpenVZ

echo 'Installing OpenVZ Kernel'
yum install -y vzkernel

echo 'Installing additional tools'
yum install -y vzctl vzquota ploop

echo 'Changing around some config files..'
sed -i 's/kernel.sysrq = 0/kernel.sysrq = 1/g' /etc/sysctl.conf
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf

echo 'net.ipv4.conf.default.proxy_arp = 0' >> /etc/sysctl.conf
echo 'net.ipv4.conf.all.rp_filter = 1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.default.send_redirects = 1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.all.send_redirects = 0' >> /etc/sysctl.conf
echo 'net.ipv4.icmp_echo_ignore_broadcasts=1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.default.forwarding=1' >> /etc/sysctl.conf

# Changing default VZ settings:
# Default to Ploop & CentOS 6 - x86_64
sed -i 's/#NEIGHBOUR_DEVS=all/NEIGHBOUR_DEVS=all/g' /etc/vz/vz.conf
sed -i 's/#VE_LAYOUT=ploop/VE_LAYOUT=ploop/g' /etc/vz/vz.conf
sed -i 's/centos-6-x86/centos-6-x86_64/g' /etc/vz/vz.conf


echo 'Done with that, purging your sys configs'
sysctl -p

sed -i 's/NEIGHBOUR_DEVS=detect/NEIGHBOUR_DEVS=all/g' /etc/vz/vz.conf
sed -i 's/SELINUX=enabled/SELINUX=disabled/g' /etc/sysconfig/selinux

clear

echo "OpenVZ Is now Installed.."

echo ' - - - - - - - - - - - - - - - - - - - - - - '
echo ' disable iptables to access VMs:$ /etc/init.d/iptables stop && chkconfig iptables off'
echo ' - - - - - - - - - - - - - - - - - - - - - - '
echo ' To download CentOS base template for openvz, run: '
echo ' cd /vz/template/cache && wget http://download.openvz.org/template/precreated/centos-6-x86_64.tar.gz '


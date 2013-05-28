#!/bin/bash
# run: source <(curl -s https://raw.github.com/qrpike/CentOS6---OpenVZ-Installer/master/installOpenVZ.sh)


clear
echo 'Going to install OpenVZ for you..'

echo 'installing wget..'
yum install -y wget

echo 'now adding openvz Repo'
cd /etc/yum.repos.d
wget http://download.openvz.org/openvz.repo
rpm --import http://download.openvz.org/RPM-GPG-Key-OpenVZ

echo 'Installing OpenVZ Kernel'
yum install -y vzkernel.x86_64

echo 'Installing additional tools'
yum install -y vzctl vzquota

echo 'Changing around some config files..'
sed -i 's/kernel.sysrq = 0/kernel.sysrq = 1/g' /etc/sysctl.conf
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf

echo 'net.ipv4.conf.default.proxy_arp = 0' >> /etc/sysctl.conf
echo 'net.ipv4.conf.all.rp_filter = 1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.default.send_redirects = 1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.all.send_redirects = 0' >> /etc/sysctl.conf
echo 'net.ipv4.icmp_echo_ignore_broadcasts=1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.default.forwarding=1' >> /etc/sysctl.conf

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


#!/bin/bash


systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl stop firewalld
systemctl disable firewalld

sed -i 's/=enforcing/=disabled/' /etc/selinux/config
#sed -i 's/^#UseDNS yes/UseDNS no/g' /etc/ssh/sshd_config
#sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/g' /etc/ssh/sshd_config
chmod +x /etc/rc.d/rc.local


yum install -y bash-completion rsync  vim wget ntpdate lrzsz  net-tools htop lsof telnet  epel-release

####ntpdate time
echo "*/30 * * * * /usr/sbin/ntpdate time7.aliyun.com >/dev/null 2>&1" >> /var/spool/cron/root

###增大文件描述符
echo "* - nofile 65536" >>/etc/security/limits.conf
echo "* - nproc 65536" >>/etc/security/limits.conf

##获得系统的基本信息
##memory
mem=$( cat /proc/meminfo | head -n1 |  awk '{print $2}')
mem_M=$( expr $mem / 1024 )

##cpu
cpu_id=$(cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l)
cpu_core=$(cat /proc/cpuinfo| grep "cpu cores"| uniq | cut -d: -f2)

##OS

os=$(cat /etc/redhat-release)

echo -e "内存大小:${mem_M}M\ncpu个数:${cpu_id} \ncpu核数:${cpu_core}" 
echo "操作系统为:${os}"

                                                                             
~                                                      

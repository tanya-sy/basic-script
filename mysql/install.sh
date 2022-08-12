wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
yum localinstall mysql57-community-release-el7-8.noarch.rpm
yum repolist enabled | grep "mysql.*-community.*"
yum install mysql-community-server -y
# 上一步安装不上就用这个命令
yum install mysql-server --nogpgcheck -y


systemctl enable mysqld
systemctl start mysqld
netstat -tunlp | grep mysqld
grep 'temporary password' /var/log/mysqld.log
mysql -uroot -hlocalhost -p


#####
  ALTER USER 'root'@'localhost' IDENTIFIED BY 'Rebin2003!';
GRANT ALL PRIVILEGES ON *.* TO root@"%" IDENTIFIED BY "Rebin2003!" with grant option;

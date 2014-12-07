sudo apt-get update
sudo apt-get install -y ubuntu-cloud-keyring

sudo apt-get install rabbitmq-server mysql-server 
sudo apt-get install nova-api nova-compute nova-volume nova-scheduler nova-objectstore dnsmasq
sudo apt-get install ntp

#NTP Config
server ntp.ubuntu.com
server 127.127.1.0
fudge 127.127.1.0 stratum 10

sudo service ntp restart

#MYSQL Config
MYSQL_ROOT_PASS=openstack
mysql -uroot -p$MYSQL_ROOT_PASS -e 'CREATE DATABASE nova;'
MYSQL_NOVA_PASS=openstack
mysql -uroot -p${MYSQL_ROOT_PASS} -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY '${MYSQL_NOVA_PASS}';"
mysql -uroot -p${MYSQL_ROOT_PASS} -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' IDENTIFIED BY '${MYSQL_NOVA_PASS}';"

# FILE /etc/nova/nova.conf
sql_connection=mysql://nova:openstack@172.16.0.200/nova


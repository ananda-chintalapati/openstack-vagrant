sudo apt-get update
sudo apt-get install -y ubuntu-cloud-keyring

sudo apt-get install rabbitmq-server mysql-server 
sudo apt-get install nova-api nova-compute nova-volume nova-scheduler nova-objectstore
sudo apt-get install ntp

#NTP config
server ntp.ubuntu.com
server 127.127.1.0
fudge 127.127.1.0 stratum 10

sudo service ntp restart



#!/bin/bash
if [ "$#" -lt "2" ];then
 echo "Need to run as follow: $0 <puppet fqdn> <puppetdb IP> <puppet fqdn IP overwrite>"
 exit
fi
cp ./puppetserver/docker-compose.yaml ./puppetserver/docker-compose.yaml.bkp
echo "-> replacing puppetserver fqdn on puppet server compose file....."
sed -e "s/PUPPETFQDNTOREPLACE/$1/g" ./puppetserver/docker-compose.yaml.bkp > ./puppetserver/docker-compose.yaml

cp ./puppetdb/docker-compose.yaml ./puppetdb/docker-compose.yaml.bkp
echo "-> replacing puppetserver fqdn on puppet DB compose file....."
sed -e "s/PUPPETFQDNTOREPLACE/$1/g" ./puppetdb/docker-compose.yaml.bkp > ./puppetdb/docker-compose.yaml

cp ./puppetserver/docker-compose.yaml ./puppetserver/docker-compose.yaml.bkp1
echo "->> replacing puppet DB ip on puppet server compose file...."
sed -e "s/1.1.1.1/$2/g" ./puppetserver/docker-compose.yaml.bkp1 > ./puppetserver/docker-compose.yaml

if [ "$#" -eq "3" ];then
 cp ./puppetdb/docker-compose.yaml ./puppetdb/docker-compose.yaml.bkp1
 echo "->> replacing puppet server ip on puppet DB compose file...."
 sed -e "s/1.1.1.2/$2/g" ./puppetdb/docker-compose.yaml.bkp1 > ./puppetdb/docker-compose.yaml
fi

echo "You can rollback by the following commands:"
echo "cp  ./puppetserver/docker-compose.yaml.bkp ./puppetserver/docker-compose.yaml"
echo "cp ./puppetdb/docker-compose.yaml.bkp ./puppetdb/docker-compose.yaml"

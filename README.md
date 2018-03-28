# puppet on docker HA (very simple to use)
There are two folders:<br>
puppet server: can run in 1 or more instances (all of the instances need to have the same shared SSL folder<br>
puppet db: need to be only one server<br>
<br>
Security group:<br>
ANY/Whitelist to puppetserver:8140 (for agents)<br>
ANY/Whitelist to puppetserver:8000 (for puppet dashboard)<br>
puppetserver to puppetdb:8080 (for DB api access)<br>
puppetserver to puppetdb:8081 (for DB api access)<br>
<br>
setup the FQDN and IP's as follow:<br>
./setup_env.sh shavit.netzer.com 192.168.1.100 192.168.1.200<br>
<br>
Remove the following from (puppet-docker-ha/puppetdb/docker-compose.yaml) in case of production and in case you have the DNS point to FQDN and published" <br>
    extra_hosts:<br>
      - "PUPPETFQDNTOREPLACE:1.1.1.2"<br>

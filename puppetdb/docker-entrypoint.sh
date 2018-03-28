#!/bin/bash

if [ ! -d "/etc/puppetlabs/puppetdb/ssl" ]; then
  while ! nc -z puppet 8140; do
    sleep 1
  done
  set -e
  /opt/puppetlabs/bin/puppet config set certname ${HOSTNAME}
#  find /etc/puppetlabs/puppet/ssl -name puppetdb.pem -delete
#  echo puppetdb > /etc/hostname
#  hostname puppetdb
#  echo "54.236.90.224 puppet.perfectomobile.com" >> /etc/hosts
  /opt/puppetlabs/bin/puppet agent --verbose --onetime --no-daemonize --waitforcert 120 -d
  /opt/puppetlabs/server/bin/puppetdb ssl-setup -f
fi


#  echo puppetdb > /etc/hostname
#  hostname puppetdb
#  echo "54.236.90.224 puppet.perfectomobile.com" >> /etc/hosts
exec /opt/puppetlabs/server/bin/puppetdb "$@"

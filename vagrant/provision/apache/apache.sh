#!/bin/sh

runfile=".runonce.apache"

if [ -f "${runfile}" ]; then
  echo "Apache provisioning already completed - ${runfile} exists - exiting"
  exit 0
fi

echo "Installing Apache ..."
yum -y install httpd

service httpd start
chkconfig httpd on
service httpd status
touch "${runfile}"

echo "Apache Install Completed"

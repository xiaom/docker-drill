#!/bin/sh
for container in "$@"
do
	new_ip=$(docker inspect $container | grep IPAddress | cut -f4 -d'"')
	echo "host-record=$container,$new_ip" > /opt/docker/dnsmasq.d/0host_$container
done
service dnsmasq restart

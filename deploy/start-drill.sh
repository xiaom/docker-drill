#!/bin/bash
set -x
for c in "$@"
do
    # start the containter
    container=$c
	docker start $container
    # check the returned value and create container if not exist. Use the DNS service of the host machine.
    if [ $? -ne 0 ]; then 
	    docker run -d -P -h $container --name $container --dns=172.17.42.1 -t xiaom/drill
    fi
    # add the containter ip to the dns record of the host machine
	## container_ip=$(docker inspect $container | grep IPAddress | cut -f4 -d'"')
	## echo "host-record=$container,$container_ip" > /opt/docker/dnsmasq.d/0host_$container
done
# service dnsmasq restart

# ZooKeeper:
#
# It is hard coded for now.
#
# The myid file consists of a single line containing only the text of that machine's id.
# So myid of server 1 would contain the text "1" and nothing else.
# The id must be unique within the ensemble and should have a value between 1 and 255.
docker exec  zoo1 sh -c 'echo 1 > /tmp/zookeeper/myid'
docker exec  zoo2 sh -c 'echo 2 > /tmp/zookeeper/myid'
docker exec  zoo3 sh -c 'echo 3 > /tmp/zookeeper/myid'
set +x

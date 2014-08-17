#!/bin/bash
for container in "$@"
do
	docker start $container
    # check the return value
    if [ $? -ne 0 ]; then 
	    docker run -d -P -h $container --name $container --dns 172.17.42.1 xiaom/drill
    fi
done
./addip.sh $@


#!/bin/bash
set -x
docker run -d -p 8047:8047 -v /var/log/docker/drill/zoo1/:/var/log/drill/ -h zoo1 --name zoo1 --dns=172.17.42.1 -t xiaom/drill
docker run -d -p 8048:8047 -v /var/log/docker/drill/zoo2/:/var/log/drill/ -h zoo2 --name zoo2 --dns=172.17.42.1 -t xiaom/drill
docker run -d -p 8049:8047 -p 60010:60010 -p 60030:60030 -v /var/log/docker/drill/zoo3/:/var/log/drill/ -h zoo3 --name zoo3 --dns=172.17.42.1 -t xiaom/hbase

# ZooKeeper:
#
# It is hard coded for now.
#
# The myid file consists of a single line containing only the text of that machine's id.
# So myid of server 1 would contain the text "1" and nothing else.
# The id must be unique within the ensemble and should have a value between 1 and 255.
# Need to wait untial container up

for i in $(seq 3)
do
    while true; do
        # https://github.com/docker/docker/issues/8703
        # Bug: docker exec does not return the executed command status
        # Thus, we cannot use the retuern value of
        #    docker exec  zoo$i sh -c "echo $i > /tmp/zookeeper/myid"
        # to decide whether the container is running
        # Instead, use docker-bash tool
        docker-bash zoo$i sh -c "echo $i > /tmp/zookeeper/myid"
        if [ $? -eq 0 ]; then
            echo "zoo"$i" Succed"
            break
        fi
        echo "Trying to connect to container zoo"$i", wait until the container up."
        sleep 1
    done
done

sleep 15
docker-bash zoo3  sh -l -c "cd /tmp/hbase && ./load-testdata.sh" 
set +x


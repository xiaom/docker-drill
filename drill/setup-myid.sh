#!/bin/sh
docker-bash zoo1 echo 1 > /tmp/zookeeper/myid
docker-bash zoo2 echo 2 > /tmp/zookeeper/myid
docker-bash zoo3 echo 3 > /tmp/zookeeper/myid

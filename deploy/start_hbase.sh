#!/bin/sh
mkdir -p /tmp/logs/docker/hbase
sudo docker run -d -v /tmp/logs/docker/hbase:/opt/hbase/logs/ --name hbase -i xiaom/hbase 

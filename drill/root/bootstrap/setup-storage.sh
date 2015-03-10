#! /bin/sh
sed  -i "s/ZK_PORT_2181_TCP_ADDR/$ZK_PORT_2181_TCP_ADDR/g" /bootstrap/hbase.json
sed  -i "s/HIVE_PORT_9083_TCP_ADDR/$HIVE_PORT_9083_TCP_ADDR/g" /bootstrap/hive.json

curl -X POST -H "Content-Type:application/json" --data @/bootstrap/hive.json  http://localhost:8047/storage/hive.json
curl -X POST -H "Content-Type:application/json" --data @/bootstrap/hbase.json  http://localhost:8047/storage/hbase.json

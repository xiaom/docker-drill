#! /bin/sh
curl -X POST -H "Content-Type:application/json" --data @hive.json  http://localhost:8047/storage/hive.json
curl -X POST -H "Content-Type:application/json" --data @hbase.json  http://localhost:8047/storage/hbase.json

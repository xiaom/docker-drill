#!/bin/sh
docker exec dockerdrill_hive_1 /bootstrap/load-data
docker exec dockerdrill_hbase_1 /bootstrap/load-data
docker exec dockerdrill_drill_1 /bootstrap/setup-storage.sh

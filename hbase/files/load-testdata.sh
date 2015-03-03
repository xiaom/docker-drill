#!/bin/sh
echo "create 'students','account','address'" | /hbase/bin/hbase shell
echo "create 'clicks','clickinfo','iteminfo'" | /hbase/bin/hbase shell
cat /opt/hbase-testdata.txt | /hbase/bin/hbase shell


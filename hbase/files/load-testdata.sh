#!/bin/sh
echo "create 'students','account','address'" | /opt/hbase/bin/hbase shell
echo "create 'clicks','clickinfo','iteminfo'" | /opt/hbase/bin/hbase shell
cat /tmp/hbase/hbase-testdata.txt | /opt/hbase/bin/hbase shell


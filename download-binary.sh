#! /bin/sh
DRILL_VERSION=0.8.0
HADOOP_VERSION=2.6.0
HIVE_VERSION=0.13.0
HBASE_VERSION=0.98.7
ZOOKEEPER_VERSION=3.4.6
curl -SsfLO "https://builds.apache.org/job/drill-scm/lastSuccessfulBuild/artifact/distribution/target/apache-drill-${DRILL_VERSION}-SNAPSHOT.tar.gz" 
curl -SsfLO "http://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz" 
curl -SsfLO "http://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz"
curl -SsfLO "http://archive.apache.org/dist/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION-hadoop2-bin.tar.gz"
curl -SsfLO "http://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz"

mv apache-drill-${DRILL_VERSION}-SNAPSHOT.tar.gz  drill/root/opt/
mv hadoop-$HADOOP_VERSION.tar.gz hive/root/opt/
mv apache-hive-$HIVE_VERSION-bin.tar.gz hive/root/opt/
mv hbase-$HBASE_VERSION.tar.gz hbase/root/opt/
mv zookeeper-${ZOOKEEPER_VERSION}.tar.gz zookeeper/root/opt/

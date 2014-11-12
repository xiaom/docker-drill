# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM xiaom/base

# Download and Install HBase
ENV HBASE_VERSION 0.94.24

RUN mkdir -p /opt/downloads && cd /opt/downloads && curl -SsfLO "http://www.apache.org/dist/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION.tar.gz"
RUN cd /opt && tar xvfz /opt/downloads/hbase-$HBASE_VERSION.tar.gz
RUN mv /opt/hbase-$HBASE_VERSION /opt/hbase

# Data will go here (see hbase-site.xml)
RUN mkdir -p /data/hbase /opt/hbase/logs
ENV HBASE_SERVER /opt/hbase/bin/hbase

ADD ./files/hbase-site.xml /opt/hbase/conf/hbase-site.xml
ADD ./files/zoo.cfg /opt/hbase/conf/zoo.cfg

# Thrift API
EXPOSE 9090
# Thrift Web UI
EXPOSE 9095
# HBase's zookeeper - used to find servers
EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master web UI at :60010/master-status;  ZK at :60010/zk.jsp
EXPOSE 60010
# Region server API port
EXPOSE 60020
# HBase Region server web UI at :60030/rs-status
EXPOSE 60030

# Add service to runit
RUN mkdir /etc/service/hbase 
ADD ./files/hbase-server /etc/service/hbase/run

# cleanup
RUN rm -rf /opt/downloads

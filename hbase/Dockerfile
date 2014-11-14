# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM xiaom/drill

# Download and Install HBase
ENV HBASE_VERSION 0.94.24

RUN cd /opt && \
  curl -SsfLO "http://www.apache.org/dist/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION.tar.gz" && \
  tar xzf hbase-$HBASE_VERSION.tar.gz && \
  mv hbase-$HBASE_VERSION hbase && \
  rm *.tar.gz && \
  mkdir -p /data/hbase && \
  mkdir -p /etc/service/hbase && \
  mkdir -p /tmp/hbase
  
ADD ./files/* /tmp/hbase/
RUN  cd /tmp/hbase/ && \
     mv hbase-site.xml /opt/hbase/conf/hbase-site.xml && \
     mv hbase-server /etc/service/hbase/run && \
     chmod +x load-testdata.sh

# Thrift API and Web UI
EXPOSE 9090 9095
# HMaster API port, Web Port, HRegion API port, HRegion Web Port
EXPOSE 2181 60000 60010 60020 60030

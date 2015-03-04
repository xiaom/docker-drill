# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM xiaom/drill

# the version number must be consistent with pom.xml
ENV HBASE_VERSION 0.98.7

# RUN curl -SsfLO "http://archive.apache.org/dist/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION.tar.gz"
ADD ./files /opt

RUN mkdir -p /hbase && \
  cd /opt && \
  tar xzf hbase-$HBASE_VERSION-hadoop2-bin.tar.gz --strip=1 -C /hbase && \
  rm *.tar.gz && \
  mkdir -p /data/hbase /etc/service/hmaster /etc/service/hregionserver

RUN  cd /opt/ && \
     mv hbase-site.xml /hbase/conf/hbase-site.xml && \
     mv hbase-master /etc/service/hmaster/run && \
     mv hbase-regionserver /etc/service/hregionserver/run && \
     chmod +x load-testdata.sh

# Thrift API and Web UI
EXPOSE 9090 9095
# HMaster API port, Web Port, HRegion API port, HRegion Web Port
EXPOSE 2181 60000 60010 60020 60030

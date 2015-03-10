FROM xiaom/base

# the version number must be consistent with pom.xml
ENV HBASE_VERSION 0.98.7

# RUN curl -SsfLO "http://archive.apache.org/dist/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION.tar.gz"
COPY root /

RUN  cd /opt && \ 
  tar xzf hbase-$HBASE_VERSION-hadoop2-bin.tar.gz --strip=1 -C /hbase && \
  rm *.tar.gz && \
  mkdir -p /data/hbase 

COPY root/hbase/conf /hbase/conf
# Thrift API and Web UI
EXPOSE 9090 9095
# HMaster API port, Web Port, HRegion API port, HRegion Web Port
EXPOSE 60000 60010 60020 60031

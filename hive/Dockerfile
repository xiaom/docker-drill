# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM xiaom/base

# Download and Install HBase
ENV HIVE_VERSION 0.13.0

RUN cd /opt && \
  curl -SsfLO "http://www.apache.org/dist/hive/apache-hive-$HIVE_VERSION/hive-$HBASE_VERSION-bin.tar.gz" && \
  tar xzf apache-hive-$HIVE_VERSION-bin.tar.gz && \
  mv apache-hive-$HIVE_VERSION hive && \
  rm *.tar.gz && \
  mkdir -p /etc/service/hive && \
  mkdir -p /tmp/hive
  
ADD ./files/* /tmp/hive/
ENV HIVE_HOME /opt/hive
ENV HIVE_CONF $HIVE_HOME/conf
RUN mv mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar $HIVE_HOME/lib
RUN cd /tmp/hive/ && \
     mv hive-site.xml /opt/hive/conf/hive-site.xml && \
     mv hive-server /etc/service/hive/run


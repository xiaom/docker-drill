# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM xiaom/base

RUN mkdir -p /opt/downloads
# Download and Install Zookeeper

RUN cd /opt/downloads && curl -SsfLO "http://www.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz"
RUN cd /opt && tar xvfz /opt/downloads/zookeeper-3.4.6.tar.gz
RUN mv /opt/zookeeper-3.4.6 /opt/zookeeper
RUN mkdir -p /tmp/zookeeper
ADD ./files/zoo.cfg /opt/zookeeper/conf/zoo.cfg

# Zookeeper - used to find servers
EXPOSE 2181 2888 3888

# Add service to runit
RUN mkdir -p /etc/service/zookeeper 
ADD ./files/zookeeper-server /etc/service/zookeeper/run

# Cleanup
RUN rm -rf /opt/downloads/* && rmdir /opt/downloads 

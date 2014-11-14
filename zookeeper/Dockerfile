FROM xiaom/base

# Download and Install Zookeeper
ENV ZOOKEEPER_VERSION 3.4.6
RUN cd /opt && \
  curl -SsfLO "http://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz" && \
  tar xvfz zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
  mv zookeeper-${ZOOKEEPER_VERSION} zookeeper && \
  rm -f *.tar.gz && \
  mkdir -p /etc/service/zookeeper 
ADD ./files/zoo.cfg /opt/zookeeper/conf/zoo.cfg
ADD ./files/zookeeper-server /etc/service/zookeeper/run

# Zookeeper - used to find servers
EXPOSE 2181 2888 3888

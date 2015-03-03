FROM xiaom/base

# Download and Install Zookeeper
ENV ZOOKEEPER_VERSION 3.4.6
# RUN  curl -SsfLO "http://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz"
ADD ./files /opt
RUN mkdir -p /zookeeper /etc/service/zookeeper

RUN cd /opt && \
  tar xfz zookeeper-${ZOOKEEPER_VERSION}.tar.gz --strip=1 -C /zookeeper && \
  rm -f *.tar.gz && \
  mv zoo.cfg  /zookeeper/conf/zoo.cfg && \
  mv zookeeper-server /etc/service/zookeeper/run

# Zookeeper - used to find servers
EXPOSE 2181 2888 3888

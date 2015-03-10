FROM xiaom/base

# Download and Install Zookeeper
ENV ZOOKEEPER_VERSION 3.4.6
# RUN  curl -SsfLO "http://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz"
COPY root /

RUN cd /opt && \
  tar xfz zookeeper-${ZOOKEEPER_VERSION}.tar.gz --strip=1 -C /zookeeper && \
  rm -f *.tar.gz

COPY root/zookeeper/conf /zookeeper/conf
# Zookeeper - used to find servers
EXPOSE 2181 2888 3888

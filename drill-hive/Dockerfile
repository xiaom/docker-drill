# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM xiaom/drill

# Install build requirements
RUN apt-get install --no-install-recommends -y mysql-server libmysql-java

ADD ./files /opt
RUN mkdir -p /hadoop /hive /etc/service/hiveserver2 /etc/service/metastore /etc/service/mysql
# ------
# Hadoop
# ------
ENV HADOOP_VERSION 2.6.0

# RUN curl -SsfLO "http://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz" 
RUN tar xzf /opt/hadoop-$HADOOP_VERSION.tar.gz --strip=1 -C /hadoop
ENV HADOOP_HOME /hadoop 

# ----
# Hive
# ----
ENV HIVE_VERSION 0.13.0
# RUN curl -SsfLO "http://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz"
RUN cd /opt; tar xzf apache-hive-$HIVE_VERSION-bin.tar.gz --strip=1 -C /hive && \
    rm *.tar.gz
ENV HIVE_HOME /hive
ENV HIVE_CONF $HIVE_HOME/conf

RUN cp /usr/share/java/mysql-connector-java.jar $HIVE_HOME/lib/ && \
    mv /opt/hive-site.xml $HIVE_CONF/hive-site.xml
    
# Metastore 
# The schematool cannot recognize version 0.13.1 and thus we use 0.13.0 instead
RUN sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf && \
  echo "mysqld_safe &" > /tmp/config && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
  echo "mysql -e 'CREATE USER \"dbuser\"@\"%\" IDENTIFIED BY \"dbuser\"; GRANT ALL PRIVILEGES ON *.* TO \"dbuser\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
  echo "$HIVE_HOME/bin/schematool -dbType mysql -initSchemaTo 0.13.0" >> /tmp/config && \
  echo "mysqladmin shutdown" >> /tmp/config && \
  bash /tmp/config && \
  rm -f /tmp/config

RUN cd /opt && \
    mv mysql /etc/service/mysql/run && \
    mv metastore /etc/service/metastore/run && \
    mv hiveserver2 /etc/service/hiveserver2/run

EXPOSE 10000

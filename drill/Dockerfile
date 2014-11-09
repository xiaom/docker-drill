# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.15

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
# make sure the package repository is up to date
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive


# Install build requirements
RUN apt-get update
RUN apt-get install -y build-essential curl openjdk-7-jdk
RUN apt-get install -y git
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN mkdir -p /opt/downloads
# Download and Install Zookeeper

RUN cd /opt/downloads && curl -SsfLO "http://www.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz"
RUN cd /opt && tar xvfz /opt/downloads/zookeeper-3.4.6.tar.gz
RUN mv /opt/zookeeper-3.4.6 /opt/zookeeper
ADD ./zoo.cfg /opt/zookeeper/conf/zoo.cfg

# Download and Install Drill
RUN cd /opt/downloads && curl -SsfLO "https://builds.apache.org/job/drill-scm/lastSuccessfulBuild/artifact/distribution/target/apache-drill-0.5.0-incubating-SNAPSHOT.tar.gz"
RUN cd /opt && tar xvfz /opt/downloads/apache-drill-0.5.0-incubating-SNAPSHOT.tar.gz
RUN mv /opt/apache-drill-0.5.0-incubating-SNAPSHOT /opt/drill
RUN mkdir -p /var/log/drill

# Download and Install etcd
RUN cd /opt/downloads && curl -s https://storage.googleapis.com/golang/go1.3.src.tar.gz | tar -v -C /usr/local -xz
RUN cd /usr/local/go/src && ./make.bash --no-clean 2>&1
ENV PATH /usr/local/go/bin:$PATH
RUN cd /opt && git clone https://github.com/coreos/etcd
RUN cd /opt/etcd && ./build

# etcd 
EXPOSE 4001 7001

# Web UI
EXPOSE 8047
# Zookeeper - used to find servers
EXPOSE 2181 2888 3888
# Drillbit
EXPOSE 31010 31011 31012

# Add service to runit
RUN mkdir -p /etc/service/drill 
ADD ./drill-server /etc/service/drill/run

RUN mkdir -p /etc/service/zookeeper 
ADD ./zookeeper-server /etc/service/zookeeper/run


RUN mkdir -p /etc/service/etcd
ADD ./etcd.sh /etc/service/etcd/run
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Workaround for the 2267 bug
RUN /usr/bin/workaround-docker-2267

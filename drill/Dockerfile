# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM xiaom/zookeeper

RUN mkdir -p /opt/downloads
ENV DRILL_VERSION 0.7.0

# Download and Install Drill
RUN cd /opt/downloads && curl -SsfLO "https://builds.apache.org/job/drill-scm/lastSuccessfulBuild/artifact/distribution/target/apache-drill-${DRILL_VERSION}-incubating-SNAPSHOT.tar.gz"
RUN cd /opt && tar xvfz /opt/downloads/apache-drill-${DRILL_VERSION}-incubating-SNAPSHOT.tar.gz
RUN mv /opt/apache-drill-${DRILL_VERSION}-incubating-SNAPSHOT /opt/drill
RUN mkdir -p /var/log/drill

# Drill Web UI
EXPOSE 8047
# Drillbit
EXPOSE 31010 31011 31012

# Add service to runit
RUN mkdir -p /etc/service/drill 
ADD ./files/drill-server /etc/service/drill/run

# Cleanup
RUN rm -rf /opt/downloads


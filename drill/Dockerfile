FROM xiaom/zookeeper

ENV DRILL_VERSION 0.7.0

RUN cd /opt && \
  curl -SsfLO "https://builds.apache.org/job/drill-scm/lastSuccessfulBuild/artifact/distribution/target/apache-drill-${DRILL_VERSION}-incubating-SNAPSHOT.tar.gz" && \
  tar xvfz apache-drill-${DRILL_VERSION}-incubating-SNAPSHOT.tar.gz && \
  mv apache-drill-${DRILL_VERSION}-incubating-SNAPSHOT drill && \
  rm *.tar.gz && \
  mkdir -p /var/log/drill && \
  mkdir -p /etc/service/drill 
# Add service to runit
ADD ./files/drill-server /etc/service/drill/run
ADD ./files/drill-override.conf /opt/drill/conf/
ADD ./files/logback.xml /opt/drill/conf/
# Web UI and three Drillbit port
EXPOSE 8047 31010 31011 31012

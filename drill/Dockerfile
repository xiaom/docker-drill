FROM xiaom/base

ENV DRILL_VERSION 0.8.0

#RUN  curl -SsfLO "https://builds.apache.org/job/drill-scm/lastSuccessfulBuild/artifact/distribution/target/apache-drill-${DRILL_VERSION}-SNAPSHOT.tar.gz" 
ADD ./files /opt
RUN mkdir -p /drill && \
  cd /opt && \
  tar xzf apache-drill-${DRILL_VERSION}-SNAPSHOT.tar.gz --strip=1 -C /drill && \
  rm *.tar.gz && \
  mkdir -p /var/log/drill && \
  mkdir -p /etc/service/drill
# Add service to runit
RUN mv /opt/drill-server /etc/service/drill/run && \
 mv /opt/drill-override.conf /drill/conf/   && \
 mv /opt/logback.xml /drill/conf/
# Web UI and three Drillbit port

# Example to update configuration
# 
# sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf

EXPOSE 8047 31010 31011 31012

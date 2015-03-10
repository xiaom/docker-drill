FROM xiaom/base

ENV DRILL_VERSION 0.8.0

#RUN  curl -SsfLO "https://builds.apache.org/job/drill-scm/lastSuccessfulBuild/artifact/distribution/target/apache-drill-${DRILL_VERSION}-SNAPSHOT.tar.gz" 

# The trick here is to use the same layout as docker container
COPY root /

RUN cd /opt && \
  tar xzf apache-drill-${DRILL_VERSION}-SNAPSHOT.tar.gz --strip=1 -C /drill && \
  rm *.tar.gz && \
  mkdir -p /var/log/drill

# The above one overwritten the configuration and we need to bring it back
COPY root/drill/conf /drill/conf

EXPOSE 8047 31010 31011 31012

FROM docker.elastic.co/logstash/logstash:7.7.1

COPY postgresql-42.2.16.jar /usr/share/drivers/postgresql-42.2.16.jar

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
RUN rm -f /usr/share/logstash/config/logstash-sample.conf
COPY logstash-postgres.conf /usr/share/logstash/pipeline/logstash.conf
COPY logstash-postgres.conf /usr/share/logstash/config/logstash.conf

ENV XPACK_MONITORING_ENABLED=false
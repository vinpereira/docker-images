FROM ico/jdk

MAINTAINER iColabora

#
# Set the version, home directory, and MD5 hash.
# MD5 hash taken from http://kafka.apache.org/downloads.html for this version of Kafka
#
ENV KAFKA_VERSION=0.10.2.1 \
    SCALA_VERSION=2.12 \
    KAFKA_HOME=/kafka

#
# Create a user and home directory for Kafka
#
USER root
RUN groupadd -r kafka -g 1001 && useradd -u 1001 -r -g kafka -m -d $KAFKA_HOME -s /sbin/nologin -c "Kafka user" kafka && \
    chmod 755 $KAFKA_HOME
RUN mkdir $KAFKA_HOME/data && \
    mkdir $KAFKA_HOME/logs

#
# Download Kafka
#
RUN curl -fSL -o /tmp/kafka.tgz $(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | sed -rn 's/.*"preferred":.*"(.*)"/\1/p')kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz

#
# Verify the contents and then install ...
#
RUN tar -xzf /tmp/kafka.tgz -C $KAFKA_HOME --strip-components 1 &&\
    rm -f /tmp/kafka.tgz

COPY ./log4j.properties $KAFKA_HOME/config/log4j.properties

#
# Change ownership and switch user
#
RUN chown -R kafka $KAFKA_HOME && \
    chgrp -R kafka $KAFKA_HOME
USER kafka

# Set the working directory to the Kafka home directory
WORKDIR $KAFKA_HOME

#
# Expose the ports and set up volumes for the data and logs directories
#
EXPOSE 9092
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY ./docker-entrypoint.sh /
# RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]

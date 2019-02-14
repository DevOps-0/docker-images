# The containers now inherits from public docker hub repository :
# see https://registry.hub.docker.com/u/profideo/php52/
FROM profideo/debian-jessie

MAINTAINER Alban Duval <aduval@profideo.com>

# Migrate from debian Jessie to debian Stretch
RUN find /etc/apt/ -type f -exec sed -i 's/jessie/stretch/g' {} +

# Change debian version
RUN apt-get -y update && apt-get -y --force-yes upgrade && apt-get clean -y --force-yes

# Install Java 8
RUN apt-get -y --force-yes install default-jre apt-transport-https
# import the Elasticsearch PGP Key
#ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
#RUN wget -qO GPG-KEY-elasticsearch https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add GPG-KEY-elasticsearch

# Add elastic package in source list
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
# Install Elasticsearch and Logstash and Kibana
RUN apt-get update && apt-get -y --force-yes install elasticsearch logstash kibana

# Install Logstash plugins
RUN /usr/share/logstash/bin/logstash-plugin install logstash-input-jdbc
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-jdbc_streaming

# Copy pipeline runner configuration
RUN rm -rf /etc/logstash/conf.d/*
COPY files/logstash/conf.d/*.conf /etc/logstash/conf.d/

# Copy Java DataBase connector Jar
RUN mkdir -p /etc/logstash/jar/
COPY files/logstash/jar/mysql-connector-java-5.1.21.jar /etc/logstash/jar/

# Useful tools
RUN apt-get -y --allow-unauthenticated install net-tools
COPY files/fix_config.sh /home/profideo/fix_config.sh
RUN chmod +x /home/profideo/fix_config.sh

RUN mkdir -p /etc/pki/tls/certs
RUN mkdir /etc/pki/tls/private

COPY files/logstash/logstash-forwarder/logstash-forwarder.key.localhost /etc/pki/tls/private/logstash-forwarder.key
COPY files/logstash/logstash-forwarder/logstash-forwarder.crt.localhost /etc/pki/tls/certs/logstash-forwarder.crt

# supervisor config
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]


EXPOSE 9200 5601 5043 22



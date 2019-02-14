#!/bin/bash

ADDRESS=`/sbin/ifconfig eth0 | grep 'inet' | awk '{ print $2}'`

# Set elasticsearch  network.host
sed -i "s/^#network.host.*/network.host: $ADDRESS/" /etc/elasticsearch/elasticsearch.yml

# Update kibana config
sed -i 's/^#server.host.*/server.host: 0.0.0.0/' /etc/kibana/kibana.yml
sed -i "s/^#elasticsearch.hosts:.*/elasticsearch.hosts: [\"http:\/\/$ADDRESS:9200\"]/" /etc/kibana/kibana.yml

# Set JVM for logstash heap dump size to 3gb
sed -i 's/-Xms1g/-Xms3g/g' /etc/logstash/jvm.options
sed -i 's/-Xmx1g/-Xmx3g/g' /etc/logstash/jvm.options

# Set ES Ip for logstash config
for filename in /etc/logstash/conf.d/*.conf; do
    sed -i "s/{{ elk_ip }}/$ADDRESS/g" $filename
done

# config DB host
echo "192.168.1.22 phpmyadmin.lesdossiers.com" >> /etc/hosts

#alias cmd_elasticsearch = "/usr/share/logstash/bin/logstash --path.settings /etc/logstash"

## Build image

**cd {PATH_TO}/elk-profideo && docker build --rm -t profideo/elk .**

Or

**docker build --rm -t profideo/elk -f {PATH_TO}/elk-profideo/Dockerfile**

## Run container

docker run --name profideo_elk -p 9200:9200 -p 22022:22 -p 5601:5601 profideo/elk:latest 

## Access ElasticSearch

**URL** : *http://127.0.0.1:9200*

**e.g** : *CURL -XGET http://127.0.0.1:9200/_cat/health*


## Access Kibana

**URL** : *http://127.0.0.1:5601*

## Exec logstash pipeline

1. Open container console : *docker exec -it profideo_elk /bin/bash*

2. Run : */usr/share/logstash/bin/logstash --path.settings /etc/logstash*
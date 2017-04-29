##### Introduction
- This folder will be updated soon. 
- Priority Order: [5]


##### Docker Images
Node: https://github.com/nodejs/docker-node
- Usage:
```
FROM node:4-onbuild
# replace this with your application's default port
EXPOSE 8888
```
- Running:
```shell
$ docker build -t my-nodejs-app .
$ docker run -it --rm --name my-running-app my-nodejs-app
```

ElasticSearch: https://github.com/elastic/elasticsearch-docker

Kibana: https://github.com/elastic/kibana-docker

LogStash: https://github.com/elastic/logstash-docker

Jenkins: https://github.com/jenkinsci/docker
* `docker run -p 8080:8080 -p 50000:50000 jenkinsci/jenkins:lts`

Nexus: https://github.com/sonatype/docker-nexus3
* `docker run -d -p 8081:8081 --name nexus sonatype/nexus3`

Sonar: https://github.com/docker-library/docs/tree/master/sonarqube
* `docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube`

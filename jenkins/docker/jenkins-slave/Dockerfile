FROM ubuntu:16.04

# Install Docker CLI in the agent
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce --allow-unauthenticated
 
RUN apt-get update && apt-get install -y openjdk-8-jre curl python python-pip git
RUN easy_install jenkins-webapi
 
# Get docker-compose in the agent container
RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN mkdir -p /home/jenkins
RUN mkdir -p /var/lib/jenkins

#RUN usermod -a -G docker jenkins
RUN apt-get update && apt-get install -y python-pip 
RUN pip install ansible 
RUN mkdir -p /home/jenkins/.ansible && \
    mkdir -p /home/jenkins/.ssh && \
    chown -R 1000:1000 /home/jenkins/.ansible && \
    chown -R 1000:1000 /home/jenkins/.ssh

# Start-up script to attach the slave to the master
ADD slave.py /var/lib/jenkins/slave.py

COPY settings.xml /root/.m2/

WORKDIR /home/jenkins
 
ENV JENKINS_URL "http://jenkins:80"
ENV JENKINS_SLAVE_ADDRESS ""
ENV JENKINS_USER "admin"
ENV JENKINS_PASS "admin"
ENV SLAVE_NAME ""
ENV SLAVE_SECRET "99049cf67ad3e70dbdbd8e8e9c57ff111d3fc568f7f4f96ca017403226292159"
ENV SLAVE_EXECUTORS "1"
ENV SLAVE_LABELS "docker"
ENV SLAVE_WORING_DIR ""
ENV CLEAN_WORKING_DIR "true"


CMD [ "python", "-u", "/var/lib/jenkins/slave.py" ]

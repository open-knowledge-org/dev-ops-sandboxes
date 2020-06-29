# Starting off with the Jenkins base Image
FROM jenkins/jenkins:centos
 
# Installing the plugins we need using the in-built install-plugins.sh script
RUN /usr/local/bin/install-plugins.sh git matrix-auth workflow-aggregator docker-workflow blueocean credentials-binding docker-commons maven-plugin ws-cleanup github-branch-source 
# authorize-project
# dashboard-view performance tikal-multijob
# jenkins-gitlab-merge-request-builder
# authorize-project

# Setting up environment variables for Jenkins admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
 
# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
 
# Start-up scripts to set number of executors and creating the admin user
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY settings.xml /root/.m2/

VOLUME /var/jenkins_home

#install docker
USER root
RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce docker-ce-cli containerd.io
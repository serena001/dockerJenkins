FROM jenkins/jenkins:lts-alpine
MAINTAINER 
USER root
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
RUN apk update && apk add docker shadow py-pip 
RUN apk add shadow && usermod -a -G docker jenkins && usermod -a -G users jenkins
RUN pip install docker-compose
COPY securityAdmin.groovy /usr/share/jenkins/ref/init.groovy.d/securityAdmin.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
USER jenkins 



FROM jenkins/jenkins:lts-alpine
MAINTAINER 
USER root
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
RUN mkdir -p \
/u01/app \
/u01/certs \
/u01/downloads \
/u01/tmp 
RUN apk --no-cache add docker shadow py-pip nodejs git
RUN apk --no-cache add maven && ln -s /usr/share/java/maven-3 /u01/app/maven
RUN apk --no-cache add shadow && usermod -a -G docker jenkins && usermod -a -G root jenkins
RUN pip install docker-compose
RUN ln -s /usr/lib/jvm/java-1.8-openjdk /usr/lib/jvm/java
COPY securityAdmin.groovy /usr/share/jenkins/ref/init.groovy.d/securityAdmin.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
USER jenkins 



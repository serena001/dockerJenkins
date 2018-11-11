FROM jenkins/jenkins:lts-alpine
MAINTAINER 
USER root
RUN apk update && apk add docker py-pip sudo
RUN echo "jenkins ALL=NOPASSWD: ALL">> /etc/sudoers
RUN pip install docker-compose
USER jenkins 



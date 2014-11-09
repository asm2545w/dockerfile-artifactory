# Dockerfile to build artifactory into a runnable linux container with
# all dependencies.
#
# It is required to install docker in order to build this dockerfile
# http://docker.com
# 
# Docker: 1.3.1
# Artifactory: 3.4.1
#
# Version: 1.0
#
FROM ubuntu:14.04.1
MAINTAINER Alvaro San Millan "asm2545w@gmail.com"

# Disable debconf frontend warnings
ENV DEBIAN_FRONTEND noninteractive

# Update apt
RUN apt-get update

# Install packages dependecies and tools
RUN apt-get install -q -y openjdk-7-jre-headless && \
    apt-get install -y unzip

# Install Artifactory
ADD http://dl.bintray.com/content/jfrog/artifactory/artifactory-3.4.1.zip?direct /tmp/artifactory.zip
RUN unzip /tmp/artifactory.zip -d / && mv /artifactory-3.4.1 /artifactory && \
    mkdir -p /artifactory/data /artifactory/backup /artifactory/logs

# Clean up
RUN apt-get clean && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && rm -rf /tmp/artifactory.zip

# Expose Artifactory port
EXPOSE 8081

# Artifactory home
ENV ARTIFACTORY_HOME /artifactory

# Expose Artifactory data, log and backup directories
VOLUME /artifactory/data
VOLUME /artifactory/logs
VOLUME /artifactory/backup

WORKDIR /artifactory
CMD ["/artifactory/bin/artifactory.sh"]

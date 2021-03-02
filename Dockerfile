FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 

RUN add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update

RUN apt-get install -y docker-ce

RUN usermod -a -G docker jenkins

# If the host machine/hypervisor is running focal ubuntu ( 20.04 ) as OS, it will assign GID 998 instead of 999
# That will cause a permission issue on the user jenkins for running docker commands
# so we changed to 998 in order to solve this issue
RUN groupmod -g 998 docker

USER jenkins

FROM jenkins:latest
MAINTAINER Josh Cox <josh 'at' webhosting.coop>

ENV OHMY_JENKINS 20170114
ENV LANG en_US.UTF-8

USER root
RUN DEBIAN_FRONTEND=noninteractive \
apt-get -qq update; apt-get -qqy dist-upgrade ; \
apt-get -qqy --no-install-recommends install \
build-essential nodejs npm perl ruby rake locales \
python3-virtualenv python3-pip python-virtualenv python-pip \
procps ca-certificates wget pwgen supervisor curl ; \
echo 'en_US.ISO-8859-15 ISO-8859-15'>>/etc/locale.gen ; \
echo 'en_US ISO-8859-1'>>/etc/locale.gen ; \
echo 'en_US.UTF-8 UTF-8'>>/etc/locale.gen ; \
locale-gen ; \
apt-get -y autoremove ; \
apt-get clean ; \
rm -Rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

USER jenkins

RUN nvm install lts/boron ; \
nvm alias default lts/boron ; \
\curl -sSL https://get.rvm.io | bash -s stable ; \
source /var/jenkins_home/.rvm/scripts/rvm ; \
rvm install ruby-2.3.3 ; \
rvm use --default ruby-2.3.3

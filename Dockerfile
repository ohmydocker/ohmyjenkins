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

USER jenkins

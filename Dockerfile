FROM jenkins:latest
MAINTAINER Josh Cox <josh 'at' webhosting.coop>

ENV OHMY_JENKINS 20170114
ENV LANG en_US.UTF-8

USER root
RUN DEBIAN_FRONTEND=noninteractive \
apt-get -qq update && apt-get -qqy dist-upgrade && \
apt-get -qqy --no-install-recommends install \
build-essential nodejs npm perl ruby rake locales \
python3-virtualenv python3-pip python-virtualenv python-pip \
openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev \
libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev \
libxslt-dev autoconf libc6-dev ncurses-dev automake libtool \
xvfb bison subversion pkg-config gawk libgdbm-dev libffi-dev \
sudo mongodb libfontconfig \
procps ca-certificates wget pwgen supervisor curl && \
echo 'en_US.ISO-8859-15 ISO-8859-15'>>/etc/locale.gen && \
echo 'en_US ISO-8859-1'>>/etc/locale.gen && \
echo 'en_US.UTF-8 UTF-8'>>/etc/locale.gen && \
locale-gen && \
gpasswd -a jenkins sudo && \
echo '%sudo ALL=(ALL) NOPASSWD:ALL'>> /etc/sudoers && \
apt-get -y autoremove && \
apt-get clean && \
rm -Rf /var/lib/apt/lists/*

USER jenkins

COPY assets /assets
RUN sudo cp /assets/rvmnvm.sh /usr/local/rvmnvm.sh && \
/bin/bash /usr/local/rvmnvm.sh  && \
cd /tmp/ ;curl -SL https://github.com/rancher/rancher-compose/releases/download/v0.12.2-rc1/rancher-compose-linux-amd64-v0.12.2-rc1.tar.gz | tar -zx && \
cd /tmp/ ;curl -SL https://github.com/rancher/cli/releases/download/v0.4.1/rancher-darwin-amd64-v0.4.1.tar.gz | tar -zx && \
sudo mv /tmp/rancher*/rancher /usr/local/bin/ && \
sudo mv /tmp/rancher*/rancher-compose /usr/local/bin/ && \
sudo chmod +x /usr/local/bin/rancher && \
sudo chmod +x /usr/local/bin/rancher-compose

USER root
RUN SUDO_FORCE_REMOVE=yes apt-get remove -qqy sudo
USER jenkins

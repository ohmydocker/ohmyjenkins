#!/bin/bash -l
mkdir -p /var/jenkins_home/tmp/mytmp && chown -R jenkins. /var/jenkins_home/tmp/mytmp && chmod 777 /var/jenkins_home/tmp/mytmp && \
cd /var/jenkins_home/tmp/mytmp/ ;curl -SL https://github.com/rancher/rancher-compose/releases/download/v0.12.2-rc1/rancher-compose-linux-amd64-v0.12.2-rc1.tar.gz |sudo tar -zx && \
cd /var/jenkins_home/tmp/mytmp/ ;curl -SL https://github.com/rancher/cli/releases/download/v0.4.1/rancher-darwin-amd64-v0.4.1.tar.gz |sudo tar -zx && \
sudo mv /var/jenkins_home/tmp/mytmp/rancher*/rancher /usr/local/bin/ && \
sudo mv /var/jenkins_home/tmp/mytmp/rancher*/rancher-compose /usr/local/bin/ && \
sudo chmod +x /usr/local/bin/rancher && \
sudo chmod +x /usr/local/bin/rancher-compose

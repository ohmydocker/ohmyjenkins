#!/bin/bash
RUBY_TARGET=ruby-2.3.3
NODE_TARGET=lts/boron
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install $NODE_TARGET
nvm alias default $NODE_TARGET
\curl -sSL https://get.rvm.io | bash -s stable
source /var/jenkins_home/.rvm/scripts/rvm
rvm requirements
rvm install --binary $RUBY_TARGET
rvm use --default $RUBY_TARGET

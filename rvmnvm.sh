#!/bin/bash
RUBY_TARGET=ruby-2.2.4
NODE_TARGET=lts/boron
nvm install $NODE_TARGET
nvm alias default $NODE_TARGET
\curl -sSL https://get.rvm.io | bash -s stable
source /var/jenkins_home/.rvm/scripts/rvm
rvm install --binary $RUBY_TARGET
rvm use --default $RUBY_TARGET

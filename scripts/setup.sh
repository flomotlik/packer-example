#!/bin/bash

set -e

echo "Instaling for rof"

# Installing vagrant keys
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 ~/.ssh/authorized_keys
chown -R vagrant ~/.ssh

# Node.js Setup
wget --retry-connrefused -q -O - https://raw.github.com/creationix/nvm/master/install.sh | sh
source ~/.nvm/nvm.sh

nvm install 0.10.18
nvm alias default 0.10.18

echo "source ~/.nvm/nvm.sh" >> ~/.bash_profile

# RVM Install
wget --retry-connrefused -q -O - https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm

rvm autolibs read-fail

rvm install 2.0.0-p195

gem install bundler zeus

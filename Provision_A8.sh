#!/bin/bash

echo Setup amalgam8 controller
# Ref https://www.amalgam8.io/docs/demo-setup.html

mkdir -p /tmp/Downloads
cd /tmp/Downloads

apt-get install python3-pip -y

# Install A8 CLI
su vagrant -c "pip3 install --user a8ctl"
echo 'export PATH=$PATH:${HOME}/.local/bin/' >>/home/vagrant/.bashrc

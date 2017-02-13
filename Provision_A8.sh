#!/bin/bash

# Setup amalgam8
# Ref https://www.amalgam8.io/docs/demo-setup.html

mkdir -p ~/Downloads
cd ~/Downloads

# Get A8 control plane
# Will be used in Dockerfiles to build containers.
wget -qO a8controller.tar.gz https://github.com/amalgam8/amalgam8/releases/download/v0.4.2/a8controller-v0.4.2-linux-amd64.tar.gz

# Install A8 CLI
pip install --user a8ctl
echo 'export PATH=$PATH:${HOME}/.local/bin/' >>/home/vagrant/.bashrc

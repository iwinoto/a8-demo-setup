#!/bin/bash
echo on

echo Setup BMX tools for CF and IBM Containers

mkdir -p ~/Downloads
cd ~/Downloads

echo "### Install Docker"
# ref: https://docs.docker.com/engine/installation/linux/ubuntu/#/install-docker
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo apt-get -y --no-install-recommends install \
    curl \
    apt-transport-https \
    ca-certificates \
    software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

sudo apt-get -y install docker-engine

#add user vagrant to docker group
sudo usermod -aG docker vagrant

echo "### Install cf-cli"
# Get cf-cli installer
wget -qO cf-cli-installer_amd64.deb https://cli.run.pivotal.io/stable?release=debian64\&version=${CF_VER}\&source=github-rel
#curl -Lo cf-cli-installer_amd64.deb https://cli.run.pivotal.io/stable?release=debian64\&version=${CF_VER}\&source=github-rel

# Install cf-cli
sudo dpkg -i cf-cli-installer_amd64.deb

echo "### Install Bluemix cli"
#Get bx cli
wget -qO bx-cli-installer_amd64.tar.gz http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_${BMX_CLI_VER}_amd64.tar.gz
#curl -Lo bx-cli-installer_amd64.tar.gz http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_${BMX_CLI_VER}_amd64.tar.gz

tar -xf bx-cli-installer_amd64.tar.gz
sudo Bluemix_CLI/install_bluemix_cli

echo "### Install Install IBM Bluemix Container Service plugin to Bluemix CLI"
bx  plugin install -r Bluemix IBM-Containers

echo "### Optionally install IBM Bluemix Container Service plugin to CF-CLI"
cf install-plugin https://static-ice.ng.bluemix.net/ibm-containers-linux_x64 -f

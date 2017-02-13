#!/bin/bash

echo Setup BMX tools for CF and IBM Containers

mkdir -p /tmp/Downloads
cd /tmp/Downloads

echo "### Install Docker"
# ref: https://docs.docker.com/engine/installation/linux/ubuntu/#/install-docker
apt-get update
apt-get install -y --no-install-recommends \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

apt-get -y --no-install-recommends install \
    curl \
    apt-transport-https \
    ca-certificates \
    software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | apt-key add -

add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

apt-get update

apt-get -y install docker-engine

#add user vagrant to docker group
usermod -aG docker vagrant

echo "### Install Docker-Compose"
curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VER}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose

# Bash completion for compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

echo "### Install cf-cli"
# Get cf-cli installer
wget -qO cf-cli-installer_amd64.deb https://cli.run.pivotal.io/stable?release=debian64\&version=${CF_VER}\&source=github-rel
#curl -Lo cf-cli-installer_amd64.deb https://cli.run.pivotal.io/stable?release=debian64\&version=${CF_VER}\&source=github-rel

# Install cf-cli
dpkg -i cf-cli-installer_amd64.deb

echo "### Install Bluemix cli"
#Get bx cli
wget -qO bx-cli-installer_amd64.tar.gz http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_${BMX_CLI_VER}_amd64.tar.gz
#curl -Lo bx-cli-installer_amd64.tar.gz http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_${BMX_CLI_VER}_amd64.tar.gz

tar -xf bx-cli-installer_amd64.tar.gz
Bluemix_CLI/install_bluemix_cli

echo "### Install Install IBM Bluemix Container Service plugin to Bluemix CLI"
su vagrant -c "bx plugin install -r Bluemix IBM-Containers"

echo "### Optionally install IBM Bluemix Container Service plugin to CF-CLI"
su vagrant -c "cf install-plugin https://static-ice.ng.bluemix.net/ibm-containers-linux_x64 -f"

sh /vagrant/Provision_A8.sh

echo "### Cleaning up"
cd ~
rm -rf /tmp/Downloads
apt-get autoremove -y

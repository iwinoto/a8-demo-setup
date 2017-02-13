# Setting up an IBM Bluemix Container Service and Amalgam8 demo environment
This repository uses Vagrant to contruct a VM that can be used to demonstrate and explore Amalgam8 either locally or on IBM Bluemix Containers Service.

The only prerequisite is to install Vagrant with a provider. These instructions have been tested with VirtualBox as the provider.

## Setup Vagrant with VirtualBox
Follow the instructions on the [Installing Vagrant page](https://www.vagrantup.com/docs/installation/).

## Crete the Amalgam8 demonstration environment
To construct the environment, from a terminal, execute, clone the repository to your workstation. From a terminal, change to the cloned directory and execute
```
$ vagrant up
```

This will download and provision the virtual machine. This step may take some time. The output may also contain some red text. The provisioning scripts have been repeatedly tested, and this is expected.

Once the virtual machine provisioning is complete, you can open a secure shell to the virtual machine with
```
$ vagrant ssh
```

## The environment
The contains the following components
 * Docker (`docker`)
 * Docker-Compose (`docker-compose`)
 * Cloud Foundry command line `cf`
 * Bluemix command line `bx`
 * IBM Bluemix Container Service plugins for Bluemix (`bx ic`) and Cloud Foundry (`cf ice`) command lines
 * Amalgam8 controller command line (`a8ctl`)

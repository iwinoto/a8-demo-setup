# Setting up an IBM Bluemix Container Service and Amalgam8 demo environment
This repository uses Vagrant to contruct a VM that can be used to demonstrate and explore Amalgam8 either locally or on IBM Bluemix Containers Service.

The only prerequisite is to install Vagrant with a provider. These instructions have been tested with VirtualBox as the provider.

## Setup Vagrant with VirtualBox
Follow the instructions on the [Installing Vagrant page](https://www.vagrantup.com/docs/installation/).

## Bootstrap the Amalgam8 demonstration environment
To construct the environment, from a terminal, execute, clone the repository to your workstation. From a terminal, change to the cloned directory and execute
```
$ vagrant up
```

_**Note:** `vagrant up` may fail with an error about `ubuntu/xenial64` not being found and needing to login to hashicorp. This is due to a [buggy `curl` utility embedded in Vagrant (on OSX 'opt/vagrant/embedded/bin/curl')](http://superuser.com/questions/1088198/cant-vagrant-up-atlassian-box). You can resolve this by removing (or renaming) the buggy utility._

All going well, `vagrant up` will download and provision the virtual machine. This step may take some time. The output may also contain some red text. The provisioning scripts have been repeatedly tested, and this is expected.

## Connect to the demonstration environment
Once the virtual machine provisioning is complete, you can open a secure shell to the virtual machine with
```
$ vagrant ssh
```

_*Note:* On starting the ssh session you may see a message of `*** System restart required ***`. Exit the ssh session and halt the virtual machine with `vagrant halt` and start it again with `vagrant up`. This will restart the virtual machine without re-provisioning. Then restart the ssh session._

## Shutdown
When you have finished and want to shutdown the virtual machine, first `exit` the ssh session. Then halt the virtual machine from the command line
```
$ vagrant halt
```

You can then restart the virtual machine with `vagrant up`.

You can also completely destroy the virtual machine with
```
$ vagrant destroy
```

After you have destroyed the virtual machine you can rebuild it with `vagrant up`.

## The environment
The virtual machine contains the following components
 * Ubuntu Xenial 16.04, 64 bit
 * Docker (`docker`)
 * Docker-Compose (`docker-compose`)
 * Cloud Foundry command line `cf`
 * Bluemix command line `bx`
 * IBM Bluemix Container Service plugins for Bluemix (`bx ic`) and Cloud Foundry (`cf ice`) command lines
 * Amalgam8 controller command line (`a8ctl`)

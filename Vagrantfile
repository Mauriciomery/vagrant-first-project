# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Create the first VM
  config.vm.define "users" do |users|
    users.vm.box = "hashicorp/bionic64"
    users.vm.network "private_network", ip: "192.168.50.11"
    users.vm.provision "shell", path: "users.sh"
  end

  # Create the second VM
  config.vm.define "auth" do |auth|
    auth.vm.box = "hashicorp/bionic64"
    auth.vm.network "private_network", ip: "192.168.50.12"
    auth.vm.provision "shell", path: "auth.sh"
  end

  # Create the third VM
  config.vm.define "front" do |front|
    front.vm.box = "hashicorp/bionic64"
    front.vm.network "private_network", ip: "192.168.50.13"
    front.vm.provision "shell", path: "front.sh"
  end

  # Create the fourth VM
  config.vm.define "todos" do |todos|
    todos.vm.box = "hashicorp/bionic64"
    todos.vm.network "private_network", ip: "192.168.50.14"
    todos.vm.provision "shell", path: "todos.sh"
  end

  # Create the fifth VM
  config.vm.define "logmessagep" do |logmessagep|
    logmessagep.vm.box = "hashicorp/bionic64"
    logmessagep.vm.network "private_network", ip: "192.168.50.15"
    logmessagep.vm.provision "shell", path: "logmessagep.sh"
  end
  #Config Virtualbox For Internet
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.memory = "2048"
  end

end


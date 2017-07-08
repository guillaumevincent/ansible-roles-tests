# -*- mode: ruby -*-
# vi: set ft=ruby :

NETWORK_PRIVATE_IP_PREFIX = "172.16.172."

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.define "centos" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.network "private_network", ip: NETWORK_PRIVATE_IP_PREFIX + "2"
    centos.vm.network :forwarded_port, guest: 22, host: 2202, id: 'ssh'
  end

  config.vm.define "debian" do |debian|
    debian.vm.box = "debian/jessie64"
    debian.vm.network "private_network", ip: NETWORK_PRIVATE_IP_PREFIX + "3"
    debian.vm.network :forwarded_port, guest: 22, host: 2203, id: 'ssh'
  end

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.network "private_network", ip: NETWORK_PRIVATE_IP_PREFIX + "4"
    ubuntu.vm.network :forwarded_port, guest: 22, host: 2204, id: 'ssh'
  end
end

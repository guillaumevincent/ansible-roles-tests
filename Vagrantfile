# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

NETWORK_PRIVATE_IP_PREFIX = "172.16.172."

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

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
end

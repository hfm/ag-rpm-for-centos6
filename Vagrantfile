# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hfm4/centos6"
  config.vm.hostname = "build-ag-rpm.vagrant.dev"
  config.vm.provision :shell do |shell|
    shell.path = "provision.sh"
    shell.privileged = false
  end
end

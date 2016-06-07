# -*- mode: ruby -*-
# vi: set ft=ruby :

# Multi machine - see: https://www.vagrantup.com/docs/multi-machine/

Vagrant.configure(2) do |config|

	config.vm.box = "ubuntu/trusty64"
	config.vm.hostname = "dockerdev"

	config.vm.synced_folder "./shared_data", "/shared_box_data"
	config.vm.synced_folder "/develop", "/develop"

	config.vm.provision :shell, path: "./shared_data/load-tools.sh"

	config.vm.provider "virtualbox" do |vb|
    	vb.memory = "1024"
	end

end

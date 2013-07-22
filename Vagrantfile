# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "canonical-ubuntu-12.04"
  
  # Ensure Chef is installed for provisioning
  config.omnibus.chef_version = :latest

  config.vm.network :forwarded_port, guest: 2480, host: 2480
  config.vm.network :forwarded_port, guest: 2424, host: 2424
  
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "orientdb"
  end

end

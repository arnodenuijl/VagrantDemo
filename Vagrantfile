# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.network :private_network, ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end
  
  config.vm.provision :shell do |shell|
  shell.inline = "mkdir -p /etc/puppet/modules;
	 			  puppet module install puppetlabs/stdlib --force;
	 			  puppet module install maestrodev/wget --force;
				  puppet module install willdurand/nodejs --force"
  end
  
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
  end

end

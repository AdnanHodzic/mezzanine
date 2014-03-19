Vagrant.configure("2") do | config |
	
	# base config
	config.vm.box 		= "centos64"
	config.vm.box_url 	= "https://s3-eu-west-1.amazonaws.com/snm-nl-hostingsupport-test/vagrant-centos-6-4.box"
	config.vm.hostname 	= "sanoma.local"
	config.vm.network 	:forwarded_port, host: 8080, guest: 80
	
	# puppet provisioning
	config.vm.provision "puppet" do | puppet |
		puppet.manifest_file 	= "default.pp"
		puppet.manifests_path 	= "./deploy/manifests"
		puppet.module_path 		= "./deploy/modules"
	end
end	

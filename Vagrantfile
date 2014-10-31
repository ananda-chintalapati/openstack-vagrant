nodes = {
	
	'chef' => [1,190],
	'controller' => [1,200],
	'compute' => [1,210],
	'glance' => [1,220],
	'swift' => [1,230],
	'ceilometer' => [1,240],
	'cinder' => [1,250]
}

Vagrant.configure("2") do |config|
	config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    nodes.each do |node, (count, address)|
    	count.times do |i|
    		hostname = "%s" % [node, (i+1)]
    		config.vm.define "#{hostname}" do |box|
    			box.vm.hostname = "#{hostname}"
    			box.vm.network :private_network, ip : "172.16.0.#{address+i}"
    			box.vm.provision "shell", inline: $script

    			box.vm.provider :virtualbox do |vbox|
					# Defaults
					vbox.customize ["modifyvm", :id, "--memory", 2048]
					vbox.customize ["modifyvm", :id, "--cpus", 1]
				end

    			if node == chef
    				vbox.customize ["modifyvm", :id, "--memory", 3172]
                    vbox.customize ["modifyvm", :id, "--cpus", 2]
    			end
    			if node == compute
    				vbox.customize ["modifyvm", :id, "--memory", 3172]
                    vbox.customize ["modifyvm", :id, "--cpus", 2]
    			end
    			if node == controller
    				vbox.customize ["modifyvm", :id, "--memory", 3172]
                    vbox.customize ["modifyvm", :id, "--cpus", 2]
    			end
    			if prefix == "cinder"
                    vbox.customize ["modifyvm", :id, "--memory", 1024]
                    vbox.customize ["modifyvm", :id, "--cpus", 1]
                end
                if prefix == "ceilometer"
                    vbox.customize ["modifyvm", :id, "--memory", 1024]
                    vbox.customize ["modifyvm", :id, "--cpus", 1]
                end
                if prefix == "glance"
                    vbox.customize ["modifyvm", :id, "--memory", 1024]
                    vbox.customize ["modifyvm", :id, "--cpus", 1]
                end
                if prefix == "swift"
                    vbox.customize ["modifyvm", :id, "--memory", 1024]
                    vbox.customize ["modifyvm", :id, "--cpus", 1]
                    vbox.customize ["createhd", "--filename", 'swift_disk2.vdi', "--size", 2000 * 1024]
                    vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', 'swift_disk2.vdi']
                end
    		end
    	end
    end

end

Vagrant.configure("2") do |config|
  config.vm.provision "shell" , inline: "echo Hello"
  
  config.vm.define "web" do |web|
	web.vm.box = "ubuntu/trusty64"
	config.vm.network "private_network", ip: "192.168.2.2"
	config.vm.network "private_network", ip: "172.16.1.2"

	config.vm.provision "shell",
    run: "always",
    inline: "route add default gw 192.168.1.2"

	config.vm.provision "shell",
    run: "always",
    inline: "eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`"
	
  end
  
  config.vm.define "sql" do |sql|
	sql.vm.box = "ubuntu/trusty64"
	config.vm.network "private_network", ip: "172.16.1.1"

	config.vm.provision "shell",
    run: "always",
    inline: "route add default gw 172.16.1.2"

	config.vm.provision "shell",
    run: "always",
    inline: "eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`"
  end
  
  config.vm.define "public" do |public|
	public.vm.box = "ubuntu/trusty64"
	config.vm.network "public_network", ip: "192.168.3.1"
	config.vm.network "private_network", ip: "192.168.1.1" 
	config.vm.network "private_network", ip: "192.168.2.1"

	config.vm.provision "shell",
    run: "always",
    inline: "route add default gw 192.168.3.1" 

  end
  config.vm.define "bastion" do |bastion|
	bastion.vm.box = "ubuntu/trusty64"
	config.vm.network "private_network", ip: "192.168.1.2"
  end
end

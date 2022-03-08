
Vagrant.configure("2") do |config|
  config.vm.provision "shell" , inline: "echo Hello"
  
  config.vm.define "nginx1" do |nginx1|
    nginx1.vm.box = "ubuntu/impish64"
    nginx1.vm.provision "shell", path: "nginx1.sh", run: 'always'
    nginx1.vm.network "private_network", ip: "172.30.1.1", virtualbox__intnet: true
    nginx1.vm.network :forwarded_port, guest: 80, host: 8080, id:"nginx1"
    nginx1.vm.synced_folder ".", "C:\VB\test"

  end

  config.vm.define "nginx2" do |nginx2|
    nginx2.vm.box = "ubuntu/impish64"
    nginx2.vm.provision "shell", path: "nginx2.sh", run: 'always'
    nginx2.vm.network "private_network", ip: "172.30.2.1", virtualbox__intnet: true
    nginx2.vm.network :forwarded_port, guest: 80, host: 8081, id:"nginx2"
    nginx2.vm.synced_folder ".", "C:\VB\test"

  end

  config.vm.define "nginx_proxy" do |nginx_proxy|
    nginx_proxy.vm.box = "ubuntu/impish64"
    nginx_proxy.vm.provision "shell", path: "nginx_proxy.sh", run: 'always'
    nginx_proxy.vm.network "private_network", ip: "172.30.1.2", virtualbox__intnet: true
    nginx_proxy.vm.network "private_network", ip: "172.30.2.2", virtualbox__intnet: true
    nginx_proxy.vm.network :forwarded_port, guest: 8082, host: 8082, id:"nginx_proxy"
    nginx_proxy.vm.synced_folder ".", "C:\VB\test"

  end
end
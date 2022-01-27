
Vagrant.configure("2") do |config|
  config.vm.provision "shell" , inline: "echo Hello"
  
  config.vm.define "nginx1" do |nginx1|
    nginx1.vm.box = "ubuntu/impish64"
    config.vm.provision "shell", path: "nginx1.sh", run: 'always'
    config.vm.network "forwarded_port", guest: 80, host: 8080, id:"nginx1"
    config.vm.synced_folder ".", "C:\VB\test"
  end

  config.vm.define "nginx2" do |nginx2|
    nginx2.vm.box = "ubuntu/impish64"
    config.vm.provision "shell", path: "nginx2.sh", run: 'always'
    config.vm.network "forwarded_port", guest: 80, host: 1111, id:"nginx2"
    config.vm.synced_folder ".", "C:\VB\test"
  end
end
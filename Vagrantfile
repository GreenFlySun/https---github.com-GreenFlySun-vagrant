
Vagrant.configure("2") do |config|
  config.vm.provision "shell" , inline: "echo Hello"
  
  config.vm.define "web" do |web|
	web.vm.box = "ubuntu/impish64"
  config.vm.provision "shell", inline: "apt-get -y update"
  config.vm.provision "shell", inline: "apt-get -y install nginx"
  config.vm.provision "shell", inline: "service nginx start"
end

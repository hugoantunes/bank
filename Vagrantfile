VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :forwarded_port, host: 8001, guest: 8000
  config.vm.provision "shell", path: "provision/setup.sh"
  config.vm.provision "shell", path: "provision/google_auth.sh"
  config.vm.provision "shell", path: "provision/django.sh"
end
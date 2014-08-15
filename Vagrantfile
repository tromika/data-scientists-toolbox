# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  #config.vm.network "forwarded_port", guest: 8787, host: 8787

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
    vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  #Customize box part

  config.vm.provision "shell", inline: "sudo apt-get update"

  config.vm.provision :file do |file|
    file.source      = 'files/run.R'
    file.destination = '/home/vagrant/run.R'
  end

  #Chef solo provisioning
  config.vm.provision "chef_solo" do |chef|
     chef.cookbooks_path = "cookbooks"
     chef.add_recipe "apt"
     chef.add_recipe "git"
     chef.add_recipe "anaconda"
     chef.add_recipe "r"
     chef.add_recipe "java"

  #Chef recipe conf
     chef.json = { 
        :anaconda => {
            :flavor => 'x86_64',
            :accept_license => 'yes',},
        :java => {
            :install_flavor => 'oracle',
            :jdk_version => '7',
            :oracle => {
              :accept_oracle_download_terms => true
                },
              },
    }
  end

  config.vm.provision "shell", path: "shell_provisioning/add_conda_to_path.sh"


  #RStudio Desktop
  config.vm.provision "shell", path: "shell_provisioning/install_Rstudio_desktop.sh"
  #LightDM
  config.vm.provision "shell", path: "shell_provisioning/install_LightDM.sh"
  #Useful R packages
  config.vm.provision "shell", path: "shell_provisioning/R_packages.sh"
  #Sublime-Text
  config.vm.provision "shell", path: "shell_provisioning/sublime-text.sh"
  #Sublime Packages
  config.vm.provision :file do |file|
    file.source      = 'files/Package Control.sublime-settings'
    file.destination = '/home/vagrant/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings'
  end

end

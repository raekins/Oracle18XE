# -*- mode: ruby -*-
# vi: set ft=ruby :

######################################################################
# Customisation. Change variables here!
#
# hostonly_network_ip_address: set this to a network that is not used on your machine.
#
hostonly_network_ip_address = "192.168.56.21"
iscsi_network_ip_address = "172.16.0.21"
#
# Linux distro
#
linux = "ol7-latest"
#
# virtual machine number of cpus.
#
vm_cpus = "2"
#
# virtual machine memory.
#
vm_memory = "2048"
#
# hostname (without .local)
#
vm_hostname = "v-oracle18xe"
# Oracle 18c XE 
oraPass = "manager"
oraWallet = "WalletPasswd123"
#
######################################################################
#
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "#{linux}"

  # synced_folder is disabled. it requires a kernel module that is specific to a kernel.
  # this module will not be there once the kernel is upgraded.
  config.vm.synced_folder "vagrant", "/vagrant", disabled: false

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.

  config.vm.hostname = "#{vm_hostname}.local"  
  config.vm.network "private_network", ip: "#{hostonly_network_ip_address}"
  config.vm.network "private_network", ip: "#{iscsi_network_ip_address}" 

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = "#{vm_hostname}" 
    vb.memory = "#{vm_memory}"
    vb.cpus = "#{vm_cpus}"
    vb.customize ["modifyvm", :id, "--description", "#{linux}\n\n#{vm_hostname}: #{hostonly_network_ip_address}"]
    vb.customize ["modifyvm", :id, "--nic1", "nat", "--cableconnected1", "on", "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nic2", "hostonly", "--hostonlyadapter2", "vboxnet0", "--cableconnected2", "on", "--nictype2", "virtio"]
    vb.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "intnet", "--cableconnected3", "on", "--nictype3", "virtio"]
  end

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook       = "playbook.yml"
    ansible.verbose        = ""
    ansible.version        = "latest"
    ansible.inventory_path = "inventory"
    ansible.install        = true
    ansible.compatibility_mode = "2.0"
    ansible.limit          = "all" # or only "nodes" group, etc.
    ansible.extra_vars = {
        oraPass: oraPass,
        oraWallet: oraWallet
    }
  end
end

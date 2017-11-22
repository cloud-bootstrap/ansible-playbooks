# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end

  config.vm.define "centos-7" do |machine|
    machine.vm.box = "centos/7"
    machine.vm.provision "shell", inline: "yum update -y && yum install -y epel-release && yum install -y ansible"
    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "packer-base.yml"
    end
  end

  config.vm.define "debian-jessie" do |machine|
    machine.vm.box = "debian/jessie64"
    machine.vm.provision "shell", inline: "apt-get update && apt-get install -y python"
    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "packer-base.yml"
    end
  end

  config.vm.define "ubuntu-xenial" do |machine|
    machine.vm.box = "ubuntu/xenial64"
    machine.vm.provision "shell", inline: "apt-add-repository ppa:ansible/ansible && apt-get update && apt-get install -y python ansible"
    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "packer-base.yml"
    end
  end
end

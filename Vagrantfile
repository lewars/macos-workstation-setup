# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.2.19"
Vagrant.configure("2") do |config|
  # TODO(alewars): move to cloud storage or artifactory
  config.vm.box = "hashicorp/bionic64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "..", "/home/vagrant/git"
  config.vm.define "foo"
  config.vm.hostname = "foo"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = "2"
  end

  home = ENV["HOME"]
  ssh_dir = "#{home}/.ssh"
  git_files = Array[".gitconfig", ".git-credentials"]
  ssh_files = Array[ "config", "id_rsa", "github", "git"]

  git_files.each do |i|
    git_file = "#{home}/#{i}"
    if(File.exists?(git_file))
      config.vm.provision "file", source: git_file, destination: "~/"
    end
  end

  ssh_files.each do |i|
    ssh_file = "#{ssh_dir}/#{i}"
    if(File.exists?(ssh_file))
      config.vm.provision "file", source: ssh_file, destination: "~/.ssh/"
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get upgrade
    apt-get install unzip -y
  SHELL

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.inventory_path = "ansible/inventory"
    ansible.verbose = false
  end
end

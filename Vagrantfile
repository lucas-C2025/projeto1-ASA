# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #configuração de todas as máquinas
  config.vm.box = "debian/bookworm64"
  config.ssh.insert_key = false
  config.vm.synced_folder "." "/vagrant", disabled:true,  SharedFoldersEnableSymlinksCreate: false
   config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = 512
    vb.linked_clone = true
    vb.check_guest_additions = false
   end
#conf da máquina arq
  config.vm.define "arq" do |arq|
    arq.vm.hostname = "arq.lucas.devops"
    arq.vm.network "private_network", ip: "192.168.56.107"
    arq.vm.disk :disk, name: "disco_adc1", size: "10GB"
    arq.vm.disk :disk, name: "disco_adc2", size: "10GB"
    arq.vm.disk :disk, name: "disco_adc3", size: "10GB"
    arq.vm.provision "ansible" do |ansible| # arquivo playbook iniciado, mas ainda é necessário diversos ajuste
      ansible.playbook = "playbooks/playbook.yml"
    end
  end
#conf da máquina db  
  config.vm.define "db" do |db|
    db.vm.hostname = "db.lucas.devops"
    db.vm.network  "private_network", type: "dhcp"
#conf da máquina app
  end
  config.vm.define "app" do |app|
    app.vm.hostname = "app.lucas.devops"
    app.vm.network "private_network", type: "dhcp"
#conf da máquina cliente
  end
  config.vm.define "cli" do |cli|
    cli.vm.network "private_network", type: "dhcp"
    cli.vm.hostname = "cli.lucas.devops"
    cli.vm.provider "virtualbox" do |vb| # checar se de fato a configuração de memória foi sobrescrita
      vb.memory = 1024
    end
  end
end

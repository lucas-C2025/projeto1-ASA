# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #configuração de todas as máquinas
  config.vm.box = "debian/bookworm64"
  config.ssh.insert_key = false
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    end
  config.vm.synced_folder "." "/vagrant", disabled:true   
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = 512
    vb.linked_clone = true
    vb.check_guest_additions = false
  config.trigger.before :"Vagrant::Action::Builtin::WaitForCommunicator", type: :action do |t|
    t.warn ="Interrompe o servidor dhcp do virtualbox"
    t.run = {inline: "vboxmanage dhcpserver stop --interface vboxnet0"}
  end
   end
#conf da máquina arq
  config.vm.define "arq" do |arq|
    arq.vm.hostname = "arq.lucas1.pedro2.devops"
    arq.vm.network "private_network", ip: "192.168.56.107" 
    arq.vm.disk :disk, name: "disco_adc1", size: "10GB"
    arq.vm.disk :disk, name: "disco_adc2", size: "10GB"
    arq.vm.disk :disk, name: "disco_adc3", size: "10GB"
    arq.vm.provision "ansible" do |ansible|
      ansible.playbook = "arq/arq-conf.yml"
    end
  end
#conf da máquina db  
  config.vm.define "db" do |db|
    db.vm.hostname = "db.lucas1.pedro2.devops"
    db.vm.network  "private_network", type: "dhcp", mac: "080027AACCDD"
    db.vm.provision "ansible" do |ansible|
      ansible.playbook = "db/db-conf.yml"
    end
  end
#conf da máquina app
  config.vm.define "app" do |app|
    app.vm.hostname = "app.lucas1.pedro2.devops"
    app.vm.network "private_network", type: "dhcp", mac: "080027AADDCC"

    app.vm.provision "ansible" do |ansible|
      ansible.playbook = "app/app-conf.yml"
    end
  end
#conf da máquina cliente
  config.vm.define "cli" do |cli|
    cli.vm.network "private_network", type: "dhcp"
    cli.vm.hostname = "cli.lucas1.pedro2.devops"
    cli.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end
    cli.vm.provision "ansible" do |ansible|
      ansible.playbook = "cli/cli-conf.yml"
    end
  end
  # provisionamento das máquinas geral
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "geral/config-geral.yml"
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "geral/config2-geral.yml"
  end
end

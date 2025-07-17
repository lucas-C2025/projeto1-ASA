#!/bin/bash
echo "capturando a interface dhcp ativa do virtualbox"
sleep 1
vbox="$(VBoxManage list dhcpservers | grep -oE "vboxnet[0-9]")" # captura a interface que está com o servidor dhcp ativado
echo "interface $vbox"
sleep 1
VBoxManage dhcpserver modify --interface $vbox --disable # desabilita a interface, dessa forma não será criada nova interface
echo "desativando..."
sleep 1
echo "rodando o vagrant up"
sleep 1
#VBoxManage hostonlyif create   -- para criar nova interface hostonly
#vboxmanage list dhcpservers
#vboxmanage list hostonlyifs

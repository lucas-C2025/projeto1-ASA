# Projeto1-ASA
#### Objetivo do trabalho: Provisionar uma infraestrutura virtual e automatizar a configuração do sistema operacional e de serviços essenciais, usando Vagrant e Ansible.

**Integrantes da equipe:**
Lucas dos Santos Carvalho e Pedro Weverton Barbosa

**Disciplina:**
Administração de Sistemas Abertos

**Professor:**
Leônidas Francisco de Lima Júnior

### Estrutura do Projeto
```
|.vagrant/
   |machine/
      |app/virtualbox/
      |arq/virtualbox/
      |cli/virtualbox/
      |db/virtualbox/
   |provisioners/ansible/inventory/
   |rgloader/
|app/            #correspondem as máquinas virtuais que serão criadas e contido em cada um desses diretórios está o playbook correspondente.
|arq/            #correspondem as máquinas virtuais que serão criadas e contido em cada um desses diretórios está o playbook correspondente.
|cli/            #correspondem as máquinas virtuais que serão criadas e contido em cada um desses diretórios está o playbook correspondente.
|db/             #correspondem as máquinas virtuais que serão criadas e contido em cada um desses diretórios está o playbook correspondente.
|geral/          #corresponde as configurações gerais 
|n-usados/       #corresponde a arquivos que foram criados durante o processo criativo para execução dessa atividade mas que acabaram por não ser efetivamente usados na execução ficando apenas para registro.
   |scrpits/
|README.md
|Vagrantfile      #são os que são necessários para execução do processo.
|ansible.cfg      #são os que são necessários para execução do processo.
|hosts.ini        #são os que são necessários para execução do processo.
```
### Como Usar

##### 1.Para executar os arquivos realize um git clone do repositório, ex:
```
git clone https://github.com/lucas-C2025/projeto1-ASA.git
```
##### 2.Após clonar execute o comando para iniciar as máquinas, esse processo levará algum tempo pois será feito todo o provisionamento de cada uma das vms, ex do comando:
```
vagrant up
```
##### 3.Após isso para que as vms designadas obtenham os endereços ips do servidor dhcp vai ser preciso desativar a interface do virtualbox, para checar os servidores dhcp sendo usados use:
```
VBoxManage list dhcpservers
```
##### 4.Em seguida, substituindo os cambos 'vboxnet1' ou 'HostInterfaceNetworking-vboxnet1' pelo que foi exibido na lista dhcp anterior, use:
```
VBoxManage dhcpserver remove --interface vboxnet1  
VBoxManage dhcpserver remove --netname HostInterfaceNetworking-vboxnet1
```
##### 5.Após isso reinice as máquinas db, app e cli, ex:
```
vagrant reload db app cli
```
##### 6.E para exibir a página web com as informações acesse a máquina cli via ssh com a opção -X, ex:
```
ssh -X lucas1@192.168.56.50
```
##### 7.E utilize o comando firefox para exibir a página web:
```
firefox
```
##### 8.por fim acesse a página do apache2 no navegador:
```    
http://192.168.56.170
```
## Referencias

**abaixo temos apenas alguns links e informações que foram usadas durante o processo de criação do trabalho**

link para documentação ansible <https://docs.ansible.com/ansible/latest/?authuser=2>

link para documentação adicional ansible <https://github.com/geerlingguy/ansible-for-devops>

link para video aulas sobre ansible(em inglês) <https://www.youtube.com/playlist?list=PL2_OBreMn7FqZkvMYt6ATmgC0KAGGJNAN>

link para documentação Vagrant <https://developer.hashicorp.com/vagrant/docs/installation>

Dica:
    'ansible-doc + comando desejado' para ver as opções do módulo, ou 'ansible-doc -l' para listar os módulos existentes



### Objetivo do trabalho: 
Provisionar uma infraestrutura virtual e automatizar a configuração do sistema operacional e de serviços essenciais, usando Vagrant e Ansible.

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
|cria-chave-ssh.sh #script para criação das chaves ssh dos usuários lucas1 e pedro2
|script-ajusta-vbox-dchp.sh # script que resolve a problemática com relação a questão do servidor dhcp presente no virtualbox
```
### Como Usar

##### 1.Para executar os arquivos realize um git clone do repositório, ex:
```
git clone https://github.com/lucas-C2025/projeto1-ASA.git
```
##### 2.Após isso verifique as interfaces ativas do servidor dhcp vai ser preciso desativar a interface do virtualbox, para checar os servidores dhcp sendo usados use:
```
VBoxManage list dhcpservers
```
##### 3.Dê permissão de execução para os scripts 'cria-chave-ssh.sh' e 'script-ajusta-vbox-dchp.sh' :
```
chmod +x cria-chave-ssh.sh && chmod+x script-ajusta-vbox-dchp.sh
```
##### 4.Em seguida execute o comando abaixo para iniciar as máquinas, caso o servidor dhcp esteja com a opção "Enabled: no" exclua o script referente da execução, esse processo levará algum tempo pois será feito todo o provisionamento de cada uma das vms:
```
./cria-chave-ssh.sh && ./script-ajusta-vbox-dchp.sh && vagrant up arq db app cli
```
##### 5.E para exibir a página web com as informações acesse a máquina cli via ssh com a opção -X, ex:
```
ssh -X lucas1@192.168.56.50
```
##### 6.E utilize o comando firefox para exibir a página web:
```
firefox
```
##### 7.por fim acesse a página do apache2 no navegador:
```    
http://192.168.56.170
```
## Referencias

**abaixo temos apenas alguns links e informações que foram usadas durante o processo de criação do trabalho**

link para documentação ansible <https://docs.ansible.com/ansible/latest/?authuser=2>

link para documentação adicional ansible <https://github.com/geerlingguy/ansible-for-devops>

link para video aulas sobre ansible(em inglês) <https://www.youtube.com/playlist?list=PL2_OBreMn7FqZkvMYt6ATmgC0KAGGJNAN>

link para documentação Vagrant <https://developer.hashicorp.com/vagrant/docs/installation>

link sobre funcionamento do virtualbox <https://www.virtualbox.org/manual/ch06.html> e <https://www.virtualbox.org/manual/topics/vboxmanage.html#vboxmanage-dhcpserver>

Dica:
    'ansible-doc + comando desejado' para ver as opções do módulo, ou 'ansible-doc -l' para listar os módulos existentes

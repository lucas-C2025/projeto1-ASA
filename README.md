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
##### Detalhes dos arquivos
```
Configuração do Vagrantfile:
- Todas as máquinas:
	 Provider: VirtualBox;
	 Box: "debian/bookworm64";
	 Geração de chaves ssh desativada;
	 Configuração da VM:
	 Memória RAM: 512 MB;
	 Utilização de clones (linked_clone);
	 Verificação de guest additions desabilitado. 

Servidor de arquivos (arq):
	 Discos adicionais: 3 discos de 10 GB cada;
	 Endereço IP na rede privada: 192.168.56.107
	 Hostname: arq.lucas1.pedro2.devops;
	 
Servidor de banco de dados (db):
	 Endereço IP na rede privada obtido via DHCP;
	 Hostname: db.lucas1.pedro2.devops;

Servidor de aplicação (app):
	 Endereço IP na rede privada obtido via DHCP;
	 Hostname: app.lucas1.pedro2.devops;
	 
Host Cliente (cli):
	 Configuração da VM:
	 Memória RAM: 1024 MB;
	 Endereço IP na rede privada obtido via DHCP;
	 Hostname: cli.lucas1.pedro2.devops.

Configuração dos playbooks:

Todas as máquinas:
	 Atualizar o sistema operacional (update e upgrade);
	 Instalar e configurar o servidor NTP (chrony) para uso do servidor pool.ntp.br;
	 Ajustar a zona de tempo para America/Recife;
	 Criar o grupo denominado ifpb;
	 Criar os usuários lucas1 e pedro2 com logins iguais ao primeiro nome de cada integrante da equipe, incluindo-os no grupo ifpb;
	 Configurar o servidor SSH com as características a seguir:
	 Permitir apenas autenticação por chaves públicas;
	 Bloquear acesso ao usuário root via SSH;
	 Permitir acesso apenas a usuários pertencentes aos grupos vagrant e ifpb;
	 Gerar e configurar chaves públicas para os usuários nome1 e nome2;
	 Apresentar mensagem de saudação ao acessar o sistema via SSH:

		Acesso apenas para pessoas com autorização expressa.
		Seu acesso está sendo monitorado !!!

	 Instalar cliente NFS
	 Permitir que usuários do grupo ifpb tenham acesso de root usando sudo.

Servidor de arquivos (arq):
	 Instalação e configuração do servidor DHCP autoritativo:
	 Nome de domínio nome1.nome2.devops (substituir nome1 e nome2 pelos primeiros nomes dos integrantes do grupo);
	 Servidores de DNS 1.1.1.1 e 8.8.8.8;
	 Escopo DHCP para a rede 192.168.56.0/24
	 Endereços gerados na faixa entre 50 e 100;
	 Gateway padrão 192.168.56.1.
	 Configuração manual para os endereços dos servidores:
	 Servidor db com endereço IP 192.168.56.1YY (substituir YY pelos dois últimos dígitos da matrícula do segundo integrante do grupo);
	 Servidor app com endereço IP 192.168.56.1XY (substituir XY pelos últimos dígitos da matrícula de cada integrante do grupo). 
	 Instalação e configuração do LVM:
	 Utilizar os 3 discos para criar um Volume Group (VG) chamado dados;
	 Criar um Logical Volume (LV) chamado ifpb com 15 GB de tamanho;
	 Formatar o LV ifpb com o sistema de arquivos ext4;
	 Configurar a partição ifpb para ser montada automaticamente no diretório /dados ao iniciar o sistema.  Instalação e configuração do serviço NFS:
	 Configurar o servidor NFS para compartilhar o diretório /dados/nfs com	qualquer host da rede 192.168.56.0/24;
	 Criar o usuário nfs-ifpb;
	 Permitir escrita no diretório apenas para o usuário nfs-ifpb;
	 Mapear automaticamente os usuários remotos para o usuário nfs-ifpb;
	 Forçar esvaziamento do buffer de memória e gravações imediatas no disco;
	 Remover o shell do usuário nfs-ifpb para aumentar a segurança.  Servidor de banco de dados (db):
	 Instalar o servidor de banco de dados mariadb-server;
	 Instalar e configurar o serviço autofs para realizar a montagem automática o compartilhamento NFS /dados/nfs do servidor arq no diretório /var/nfs.

Servidor de aplicação (app):
	 Instalar e configurar o servidor web apache2
	 Criar e transferir um arquivo index.html para substituir a página default do Apache, o qual deverá conter a descrição do projeto, o nome e a matrícula dos integrantes da equipe.
	 Instalar e configurar o serviço autofs para realizar a montagem automática do diretório /dados/nfs compartilhado via NFS pelo servidor arq no diretório /var/nfs.

Host Cliente (cli):
	 Instalar os pacotes firefox-esr e xauth;
	 Ajustar o servidor SSH a permitir a exportação da interface dos aplicativos X11;
	 Instalar e configurar o serviço autofs para realizar a montagem automática o compartilhamento NFS /dados/nfs do servidor arq no diretório /var/nfs.


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

#!/bin/bash
echo "Criando chaves SSH para os usuários lucas1 e pedro2"
sleep 1
ssh-keygen -t rsa -f ~/.ssh/id_lucas1_arq && ssh-keygen -t rsa -f ~/.ssh/id_pedro2_arq && echo "criadas com sucesso"


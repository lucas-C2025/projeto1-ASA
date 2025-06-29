#!/bin/bash

# Caminho onde estão os arquivos de MAC coletados
MAC_DIR=~/ifpb/asa/projeto1-ASA/mac-coletados

# IP inicial fixo (ajuste conforme sua faixa)
IP_PREFIX="192.168.56"
IP_BASE=51

# Arquivo de saída temporário
STATIC_CONF="/home/lucas/ifpb/asa/projeto1-ASA/dhcpd.conf"

# Para cada arquivo *_mac na pasta
for file in "$MAC_DIR"/*_mac; do
    hostname=$(basename "$file" _mac)
    mac=$(cat "$file")

    echo "host $hostname {" >> "$STATIC_CONF"
    echo "  hardware ethernet $mac;" >> "$STATIC_CONF"
    echo "  fixed-address $IP_PREFIX.$IP_BASE;" >> "$STATIC_CONF"
    echo "}" >> "$STATIC_CONF"
    echo "" >> "$STATIC_CONF"

    IP_BASE=78
done

# Junta com seu dhcpd.conf
cat /caminho/para/seu/dhcpd.conf.original "$STATIC_CONF" > /etc/dhcp/dhcpd.conf


#!/bin/bash

# Comprobamos si el número de argumentos es correcto
if [ $# -ne 1 ] 
then
    echo "Número incorrecto de argumentos. Uso: $0 [nombre_archivo]"
    exit 1
fi
if [ "$UID" -ne 0 ]
then
    echo "Se necesitan privilegios de admin"
    exit 1
fi

# Obtenemos la IP del interfaz eth0
ip_eth0=$(ip addr show eth0 | grep inet | awk '{ print $2; }' | cut -d'/' -f1)

# Obtenemos la subred de eth0 teniendo en cuenta la mascara de red 255.255.0.0
subnet_eth0=$(echo $ip_eth0 | cut -d"." -f1-2)

# Buscamos las IPs en el archivo de logs
ips=$(cut -d' ' -f1 $1 | grep "^$subnet_eth0")

# Bloqueamos el tráfico de las IPs encontradas y enviamos un email al usuario root
for ip in $ips 
do
    iptables -A INPUT -s $ip -j DROP
    echo "La IP $ip ha sido bloqueada" | mail -s "IP bloqueada" root
done

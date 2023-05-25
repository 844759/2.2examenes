#!/bin/bash

# Mezclamos los ficheros de hosts en uno sin ips repetidas
for ip in 172.16.0.{0..255}
do
    ssh -n as@$ip "cat /etc/hosts | egrep "[0-9]+\."" 
done | sort -k1 | uniq > /tmp/ips_nr

# Copiamos el fichero resultante en todos los nodos
for ip in 172.16.0.{0..255}
do
    # Copia el archivo al directorio home del usuario remoto
    scp /tmp/ips_nr as@$ip:/hosts

    # Conéctate al servidor remoto y usa sudo para mover el archivo a /etc
    ssh as@$ip 'sudo mv /hosts /etc/hosts'

    # Relanzar servicio de internet
    ssh -n as@$ip "service networking restart" 
 
done


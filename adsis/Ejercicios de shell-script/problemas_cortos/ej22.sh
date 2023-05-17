#!/bin/bash

ip=("172.16.1.1" "172.16.1.2" "172.16.1.3" "172.16.1.4" "172.16.1.5" "172.16.1.6" "172.16.1.7")

nodos=""

for i in "${ip[@]}"
do

    ping -q -c3 -W1 $ip > /dev/null 2>&1
    if [ $? -ne 0 ] 
    then
        nodos=$(echo "${ip[$i]}")
    fi

done

# Si hay algún nodo caído, enviamos un correo electrónico al administrador
if [ -z "$nodos" ] 
then
    echo "Los siguientes nodos están caídos: $nodos" | mail -s "Alerta de nodos caídos" admin@dominio.com
fi
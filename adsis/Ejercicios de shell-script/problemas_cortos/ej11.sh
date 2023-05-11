#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Debe introducir un nombre de host y su ip"
    exit 1
fi

host_name=$(echo "$1")
ip=$(echo $2)

if grep "$host_name" /etc/hosts || grep "$ip" /etc/hosts
then
    echo "El host ya existe en el fichero"
    exit 1
else
    # Se usa ping con un tiempo de espera de 5 segundos especificado con el
    # flag -W 5, despues con el flag -c 1 se especifica el numero de paquetes que se envian
    # ademas se redirige la salida estandar a dev/null para silenciarla y con la de error
    # sucede lo mismo.
    if ping -W 5 -c 1 "$ip"  > /dev/null 2>&1
    then
        echo "No se puede comunicar con el host $host_name con ip $ip"
        exit 1
    else
        echo ""$host_name" $ip" >> /etc/hosts
        echo "Nodo añadido" 
    fi
fi 

exit 0


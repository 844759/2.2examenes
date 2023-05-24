#!/bin/bash

fecha=$(date '+%a %b %d')
while read linea
do

    user=$(echo "$linea" | awk '{print $1}')
    intentos=$(lastb | sort | uniq | grep "$user" | grep "$fecha" | wc -l)
    if [ $intentos -gt 10 ]
    then
        echo "El usuario: $user ha excedido 10 intentos en el dia $fecha"
        usuarios+=" $user"
    fi

done < <(lastb | awk '{print $1}' | sort | uniq)

echo "$usuarios" | mail -s "Lista de usuarios login incorrecto" root
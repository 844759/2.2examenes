#!/bin/bash

nombre="serverless"

if [ $# -ne 1 ]
then
    echo "Modo de uso ./ej12.sh <execute_file>"
    exit 1
fi

if file $1 | grep -q "ELF 64-bit LSB shared object" || file $1 | grep -q "Bourne-Again shell script"
then
    if ! ldd $1 | grep "not found"
    then
        echo "El fichero binario no tiene las bibliotecas instaladas"
        exit 1
    else
        i=0
        while grep -q "$nombre$i" /tmp/nombres
        do
            i=$(($i+1))
        done
        # Copiamos el fichero al nodo
        scp $1 as@192.168.56.1:/$nombre$if.sh

        # Fichero que contiene los nombres de los ejecutables unicos
        echo "$nombre$i" >> /tmp/nombres
        
        # Parametro de sobrecarga
        sobrecarga=$(cat /proc/loadavg | cut -d' ' -f2)

        if (echo "scale=2; ($sobrecarga > 0.6)" | bc -l)
        then
            echo "Sobrecarga duermo 3 minutos"
            sleep 180
        fi

        #Ejecuccion del binario
        ssh -n as@192.168.56.1 "./$nombre$i.sh 2>&1" 

    fi

else
    echo "El fichero introducido no es valido"
    exit 1
fi

exit 0
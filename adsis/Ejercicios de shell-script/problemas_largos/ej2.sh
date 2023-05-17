#!/bin/bash

if [ $# -lt 3 ]
then
    echo "El numero de parametros es incorrecto, se necesitan 3 o más parametros"
    exit 1
fi

user=$1
destino=$2

# Se eliminan los dos primeros argumentos
shift 2

# Se itera por los diferentes archivos especificados
for i in $@
do
    if [ -d $i ]
    then
        for fich in "$i"/*
        do 
            if [ -f "$fich" ]
            then
                md5_local=$(md5sum "$fich")
                ssh -n "$user" "cd "$destino""
                md5_remote=$(ssh -n "$user" "md5sum "$fich"")
                if [ "$md5_local" != $md5_remote ]
                then 
                    # Se copia los archivos de la maquina remota a la local
                    scp "$fich" "${user}:${destino}/${i}"
                fi
            fi
        done
    elif [ -f $i ]
    then
        md5_local=$(md5sum "$i")
        ssh -n "$user" "cd "$destino""
        md5_remote=$(ssh -n "$user" "md5sum "$i"")
        if [ "$md5_local" != "$md5_remote"]
        then
            # Se copia los archivos de la maquina remota a la local
            scp "$i" "${user}:${destino}/${i}"
        fi
    fi
done

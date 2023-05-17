#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Uso correcto del script: ./ej30.sh Process_name"
    exit 1
fi

if [ "$UID" -ne 0 ]
then
    echo "El script necesita privilegios de admin"
    exit 1
fi

pgrep "$1"
if [ $? -eq 0 ]
then
    echo "Nombre de proceso encontrado"
    list=($(pgrep "$1"))
    for i in "${list[@]}"
    do
        kill "$i"
    done
else
    echo "Nombre de proceso no encontrado"
    exit 1
fi
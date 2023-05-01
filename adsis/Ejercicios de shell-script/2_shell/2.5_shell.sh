#!/bin/bash
# Localice en su sistema la utilidad 'banner' para consola. Puede haber mas de una utilidad
# para esto y algunas están pensadas para su uso con impresora. Nos interesa la utilidad
# 'banner' para terminal de forma que el comando 'banner hola' genere la siguiente salida:

if [ $# -lt 3 ]
then

    echo -n "Numero de incorrecto de argumentos"
    exit 1
fi

echo "$@" | tr ' ' '\n' | grep -vE '^.{1,4}$'

if [ $? -eq 0 ]
then
    echo "Las palabras tienen que tener al menos 4 caracteres"
    exit 1
fi

banner "$1"
banner "$2"
banner "$3"
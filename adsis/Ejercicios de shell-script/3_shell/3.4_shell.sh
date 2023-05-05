#!/bin/bash
# Tenemos en un sistema tipo UNIX a una serie de usuarios ya creados. Hemos visto que algunos de ellos 
# tienen su cuenta invadida por personas sin derecho a usar el equipo. Una cuenta está invadida si en el 
# home del usuario hay un directorio llamado ".rootkit".

if [ $# -ne 1 ]
then
    echo "Numero de parametros incorrecto"
    exit 1
fi

while read linea
do
    dir=$( echo "$linea" | cut -d':' -f5)           # Recogemos el directorio home del usuario
    cd $dir                                         # Nos movemos al directorio de usuario
    ls -l | grep "$dir/.rootkit" > /dev/null        # Buscamos alguna coincidencia para saber si existe el archivo invadido

    # Si la salida del comando anterior es correcta, es decir a encontrado una coincidencia
    if [ $? -eq 0 ]
    then       

        echo "El usuario esta invadido"
        if [ ! -d "/invadidos/" ]       # Si el directorio no existe se crea
        then

            mkdir /invadidos/
        fi

        mv $dir /invadidos/             #Movemos el home del usuario a /invadidos/
    else

        user=$( echo "$linea" | cut -d':' -f1)  # Recogemos el nombre del usuario
        finger $user                            # Mostramos la informacion de este
    fi
done < $1
#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Se ha de introducir un fichero de usuarios"
    exit 1
fi

if [ "$UID" -ne 0 ]
then
    echo "Se necesitan privilegios de administracion"
    exit 1
fi

while read user
do

    # Se comprueba si existe el usuario en el sistema
    cat /etc/passwd | grep ""$user""

    # Si grep encuentra una coincidencia el usuario existe
    if [ $? -eq 0 ]
    then

        if [ -d "/home/"$user"/.ssh" -a -r "/home/"$user"/.ssh" -a -w "/home/"$user"/.ssh" -a -x "/home/"$user"/.ssh" ]
        then
            echo "Permisos de .ssh correctos"
        else
            echo "Permisos incorrectos de .shh"
        fi

    else
        echo "Usuario no registrado en el sistema se procede a eliminar sus archivos"

        if [ -d "/home/"$user"" ]
        then
            rm -r "/home/"$user""
        fi
        
    fi

done < $1

exit 0

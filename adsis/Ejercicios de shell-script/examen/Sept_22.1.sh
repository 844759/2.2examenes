#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Modo de uso: ./Sept_22.1.sh <Fichero claves> <Funciones Criptograficas"
    exit 1
fi

if [ "$UID" -ne 0 ]
then
    echo "Se necesitan privilegios de administrador para ejecutar el script"
    exit 1

while read clave
do
    
    while read funcion
    do

        cript=$(echo "$clave" | "$funcion")
        # Buscamos la clave para ver si hay coincidencia
        match=$(grep "$cript" /etc/shadow)

        if [ ! -z "$match" ]
        then
            user=$(echo "$match" | cut -d':' -f1)
            echo ""$clave" "$funcion" ("$user")"
            echo "Tendra que cambiar la constraseña en el siguiente inicio de sesion" | mail -s "Su contraseña no es segura" ""$user"@gmail.com"
            passwd -e "$user"
        fi

    done < $2
    
done < $1

exit 0

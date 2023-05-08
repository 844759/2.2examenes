#!/bin/bash

if [ "$UID" -ne 0 ]
then
    echo "Se necesitan privilegios de administrador"
    exit 1
fi

if [ $# -ne 2 ]
then
    echo "Se necesitan un usuario y una nueva contraseña"
    exit 1
fi

#Expresion regular que solo deja pasar aquellas constraseñas que tengan al menos 8 caracteres alfanumericos
echo "$2" | grep "[[:alnum:]]\{8,\}"
 
#Si se ha encontrado alguna coincidencia
if [ $? -eq 0 ]
then
    # Se cambia la constraseña del usuario
    echo -e "$2\n$2" | passwd $1
else
    echo "La constraseña debe de tener al menos 8 caracteres alfanumericos"
    exit 1
fi



#!/bin/bash
# Dado un fichero con nombres y apellidos, generar una dirección de correo @unizar para 
# cada línea, que contenga la primera letra del nombre y todo el apellido.

while read nombre apellido apellido2
do
    letra=$( echo $nombre | cut -c 1 )                           # Cortamos la primera letra del nombre

    # Miramos si hay segundo apellido, para ello miramos la longitud del string, si esta vacio no tiene segundo apellido cogemos por tanto solo el primero
    if [ -z $apellido2  ]
    then
        echo ""$letra""$apellido"@unizar.es" | tr  'A-Z' 'a-z'      # Mostramos la dirección de correo nueva, usando tr para cambiar las mayusculas por minusculas
    else
        echo ""$letra""$apellido2"@unizar.es" | tr  'A-Z' 'a-z'      # Mostramos la dirección de correo nueva, usando tr para cambiar las mayusculas por minusculas
    fi
    

done < nombres.txt  # A la entrada estandar el bucle se le mete el fichero
#!/bin/bash
# Dado un fichero con nombres y apellidos, generar una dirección de correo @unizar para 
# cada línea, que contenga la primera letra del nombre y todo el apellido.

while read linea
do
    letra=$( echo $linea | cut -c 1 )                           # Cortamos la primera letra del nombre
    apellido=$( echo $linea | cut -d' ' -f2 )                   # Cortamos el apellido de la linea
    echo ""$letra""$apellido"@unizar.es" | tr  'A-Z' 'a-z'      # Mostramos la dirección de correo nueva, usando tr para cambiar las mayusculas por minusculas

done < nombres.txt  # A la entrada estandar el bucle se le mete el fichero
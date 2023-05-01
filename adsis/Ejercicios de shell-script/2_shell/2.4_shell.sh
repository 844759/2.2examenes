#!/bin/bash
# Hacer un shell script que dado un fichero de texto, cuente las cinco palabras más repetidas.

# Pide al usuario que ingrese el nombre del archivo
echo -n "Ingresa el nombre del archivo de texto: "
read archivo

# Verifica si el archivo existe
if [ ! -f $archivo ] 
then

  echo "El archivo no existe."
  exit 1
fi

# Cuenta las palabras del archivo y las ordena por frecuencia de ocurrencia
cat $archivo | tr ' ' '\n' | sort | uniq -c | sort -t' ' -nrk1 | head -n 5

# Se muestra con cat el interior del archivo, despues con tr se modifica el contenido del archivo
# para separar todas las letras, se utiliza sort para agrupar las diferentes palabras para posteriormente
# con uniq quedarnos con aquellas que son iguales y se usa el flag c para contar cuantas veces se repiten
# una vez hecho esto con sort ordenamos el resultado de uniq de mayor a menor para ello se usa el flag
# n de ordenar numericamente, r de orden inverso y el primer campo k seleccionando con t el delimitador ' ',
# despues con head nos quedamos con las primeras 5 lineas de la salida.

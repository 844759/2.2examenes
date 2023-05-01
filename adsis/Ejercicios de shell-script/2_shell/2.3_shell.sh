#!/bin/bash
# Tenemos un directorio que contiene, entre otras cosas, scripts de shell. Se desea 
# modificarlos, insertando entre su primera y segunda línea el copyright del autor y la fecha, 
# de forma que:

if [ $# -ne 2 ]
then
    echo "Número incorrecto de parametros, introduzca un fichero"     # Se comprueba que se haya metido un fichero como parametro
    exit 1
fi

# Obtener el contenido del fichero de licencia
licencia=$(cat $2)

while read archivo
do
    # Se utiliza el comando sed con el flag -i para modificar el archivo en la
    # linea seleccionada en este caso la segunda indicada con 2i, posteriormente 
    # se usa date para obtener la fecha y seleccionamos el archivo que se modificara
    sed -i "2i # $licencia\n# $(date)" "$archivo"

done < $1

#!/bin/bash
# Tenemos un directorio que contiene, entre otras cosas, scripts de shell. Se desea modificarlos, insertando
# entre su primera línea y segunda el copyright del autor y la fecha.

if [ $# -ne 2 -o ! -f $2 -o ! -d $1 ]
then
    echo "Número incorrecto de parametros o no es un archivo regular o el segundo parametro no es un directorio" >&2    # Se comprueba que se haya metido un fichero como parametro
    exit 1
fi

# Obtener el contenido del fichero de licencia
licencia=$(cat $2)
# Nos movemos al directorio con los scripts
cd $1

while read linea
do
    # Sustituye todos los espacios en medio que aparezcan más de una vez por uno solo, esto se realiza para que 
    # el cut funcione correctamente y corte el campo descrito
    archivo=$( echo "$linea" | sed -r 's/ +/ /g' | cut -d' ' -f9)
    # Se utiliza el comando sed con el flag -i para modificar el archivo en la
    # linea seleccionada en este caso la segunda indicada con 2i, posteriormente 
    # se usa date para obtener la fecha y seleccionamos el archivo que se modificara
    sed -i "2i # $licencia\n# $(date)" "$archivo"

done < <(ls -l | grep "sh$")

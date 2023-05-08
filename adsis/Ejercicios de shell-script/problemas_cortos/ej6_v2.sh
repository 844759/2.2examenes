#!/bin/bash

# Comprobar numero de parametros
if [ $# -lt 2 ]
then
    echo "Para ejecutar el script es necesario la ruta de un directorio y prefijo de fichero tar"
    exit 1
fi

# Mes actual en el que se ejecuta el script
mes_act=$( date | cut -d' ' -f3 )
# Nombre del fichero tar
tar=$(echo ""$1"_$mes_act")
# Creamos el tar
tar -cf "$tar" --files-from /dev/null

# Descartar el primer parámetro (prefijo del tar)
shift

for dir in $@
do
    # Comprobar que el directorio existe
    if [[ -d $dir ]]
    then
        find "$dir" -type f -mtime +30 -exec tar -rf "$tar" {} \;
    else
        echo "Advertencia: $directorio no es un directorio válido. Ignorando..."
    fi
done

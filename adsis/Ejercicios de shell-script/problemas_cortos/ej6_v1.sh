#!/bin/bash

# Comprobar numero de parametros
if [ $# -ne 2 ]
then
    echo "Para ejecutar el script es necesario la ruta de un directorio y prefijo de fichero tar"
    exit 1
fi

# Comprobar que el directorio existe
if [[ ! -d $1 ]]
then
    echo "El directorio $1 no existe"
    exit 1
fi

# Mes actual en el que se ejecuta el script
mes_act=$( date | cut -d' ' -f3 )
# Nombre del fichero tar
tar=$(echo ""$2"_$mes_act")
# Creamos el tar vacio
tar -cf "$tar" --files-from /dev/null

while read linea
do
    fich=$( echo $linea | sed -r 's/ +/ /g' | cut -d' ' -f9)
    
    if [ -f "$fich" ]
    then
        mes_fich=$( echo $linea | sed -r 's/ +/ /g' | cut -d' ' -f6 )
        if [ $mes_act = $mes_fich ]
        then
            tar -rf "$tar" "$fich"
        fi
    fi
    
done < <(ls -l)
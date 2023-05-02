#!/bin/bash
# Tenemos un directorio que contiene, entre otras cosas, fotos: ficheros con extensión .jpg o .JPG. Las 
# fotos tienen mucha resolución. Queremos reducirlas a 800x600 puntos y publicar la versión reducida en una 
# web. 

if [ $# -ne 1 ]
then
    echo "Numero de parametros insuficientes"
    exit 1
fi

cd $1

pub=0   # Contador de publicados
cont=0  # Contador de contaminados

OldIFS=$IFS
IFS=' '
while read archivo
do
    tipo=$( file "$archivo" | cut -d' ' -f3 )   # Buscamos el tipo del archivo

    if [ $tipo = "image" ]
    then
        convert -geometry 800x600 $archivo $archivo     # Si es imagen se reduce y publica
        pub=$((pub+1))
        echo "$archivo ok. Reducida y publicada"
    else
        echo "$archivo CONTAMINADO. Se borra el fichero"    # Se borra el fichero puesto no es una imagen
        cont=$((cont+1))
        rm "$archivo"
    fi

done < <(ls) # Cogemos todo el contenido del fichero y redireccionamos la salida al bucle while
IFS=$OldIFS

echo "$cont ficheros contaminados y borrados"
echo "$pub ficheros reducidos y publicados"
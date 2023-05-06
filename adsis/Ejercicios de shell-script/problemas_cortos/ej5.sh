#!/bin/bash

if [ $# -lt 1 ]
then
    echo "EL script necesita al menos un enlace de una pagina web"
    exit 1
fi

cont=0 #ariable contador de paginas web con enlace seguro

for web in $@
do

    # Descargar la página web y buscar los enlaces seguros (https)
    https_links=$(curl -s "$web" | grep -o -E "https://[^\"']+" | wc -l)

    # Imprimir el resultado para la página actual
    echo "$web: $https_links enlaces seguros"

done

exit 0
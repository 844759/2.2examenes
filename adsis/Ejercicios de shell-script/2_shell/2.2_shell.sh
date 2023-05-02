#!/bin/bash
# Un profesor tiene las notas de los alumnos que se presentaron a un examen en
# un fichero de texto. Cada línea está compuesta por el nombre y apellido del 
# alumno, un espacio y su calificación, que siempre será apto o no apto.

if [ $# -ne 1 ]
then
    echo "Número correcto de parametros, introduzca un fichero"     # Se comprueba que se haya metido un fichero como parametro
    exit 1
fi

pre=0
apr=0

while read nombre apellido nota1 nota2
do
    letra=$( echo $nombre | cut -c 1 )           # Cortamos la primera letra del nombre

    dir=$( echo ""$letra""$apellido"@unizar.es" | tr  'A-Z' 'a-z' )  # Recogemos la direccion del mail y pasamos las mayusculas a minusculas 

    pre=$((pre+1))                            # Incrementamos la variable contador de alumnos presentados  

    if [ "$nota1" = "apto" ]
    then
        apr=$((apr+1))                            # Incrementamos la variable contador de alumnos aprobados 
        echo "mailto: "$dir" body: "$nombre" "$apellido" "$nota". Presentados: "$pre", aprobados: "$apr"."  # Mostramos el resultado mostrando la informacion pertinente.

    else
        echo "mailto: "$dir" body: "$nombre" "$apellido" no apto. Presentados: "$pre", aprobados: "$apr"."  # En caso de que no sea apto no mostramos la variable nota.

    fi

done < $1
 
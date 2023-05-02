#!/bin/bash
# En cierta asignatura, los estudiantes deben realizar una página web. Todos los matriculados tienen 
# cuenta en la máquina, aunque algunos nunca han llegado a abrir una sesión. A estos los llamaremos 
# usuarios inactivos. Se desea hacer un script bash que haga una copia de la web de todos los usuarios 
# activos, que borre la cuenta de los usuarios inactivos y que muestre un pequeño informe de lo que está 
# haciendo. 

dir="passwd.txt"

grep '/home/al-03-04' $dir

while read linea
do
    user=$( echo $linea | cut -d':' -f1 )

    log=$( finger $user | grep 'Never logged in' )  # Si el usuario nunca ha iniciado sesion con grep encontraremos una coincidencia

    if [ $? -eq 0 ]
    then

        echo ""$user". Usuario inactivo, se borra su cuenta"
        userdel $user
    else

        echo ""$user". Usuario activo, copiando su web /var/tmp/"$user""
        mkdir /var/tmp/"$user"
        wget -m http://localhost/~"$user"
        cp "$user" /var/tmp/"$user"
    fi

    
done < <(grep '/home/al-03-04' $dir)
#!/bin/bash
# Tenemos un laboratorio de PCs donde cada ordenador tiene un fichero /etc/hosts que indica los nombres 
# y direcciones IP de las demás máquinas. Vamos a cambiar de dirección las máquinas gammaNN (donde NN es el número del ordenador). La nueva 
# dirección de cada máquina será
#                                            192.168.0.YY
#                                            donde YY= NN+40                 

hosts_file="hosts.txt"
new_hosts_file=$(mktemp)    # Creamos fichero temporal

while read ip dir name
do

    user=$( echo "$name" | cut -c 1-5 ) # Recogemos el nombre del usuario sin su identificador

    if [[ $user = "gamma" ]] 
    then
        nn=$(echo $name | cut -c 6-7)   # Si el usuario es gamma, recogemos su nn
        yy=$((nn + 40))                 # Calculamos el YY
        new_ip="192.168.0.$yy"          # Guardamos la nueva ip a poner
        echo "$new_ip $dir $name" >> $new_hosts_file    # Guardamos en el fichero la nueva informacion
    else
        echo "$ip $dir $name" >> $new_hosts_file    # Guardamos la informacion original
    fi

done < $hosts_file

cp $new_hosts_file $hosts_file  # Copiamos el contenido
rm $new_hosts_file              # Eliminamos el archivo temporal


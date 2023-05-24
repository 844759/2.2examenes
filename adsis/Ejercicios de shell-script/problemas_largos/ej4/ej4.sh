#!/bin/bash

discos=("dev/sda" "dev/sdb" "dev/sdc" "dev/sdd" "dev/sde" "dev/sdf" "dev/sdg" "dev/sdh" "dev/sdi" "dev/sdj")

# Comprobamos el uso de disco del volumen lógico
usage=$(df /home | tail -n 1 | awk '{print $5}' | sed 's/%//')

# Si el uso de disco es mayor al 90%, añadimos un disco al grupo de volúmenes
if [ $usage -gt 90 ] 
then
    for device in "${discos[@]}"
    do
        if ! pvs | grep -q $device; then
            vgextend vg_pool $device
            lvextend -l +100%FREE /dev/vg_pool/lv_home
            resize2fs /dev/vg_pool/lv_home
            ./ej4_mail.sh
        fi
    done
fi

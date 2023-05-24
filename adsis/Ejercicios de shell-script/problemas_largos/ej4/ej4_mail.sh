#!/bin/bash

# Comprobamos si todos los discos duros están en uso
if pvs | grep -q "/dev/sdj1"; then

    # Comprobamos el uso de disco del volumen lógico
    usage=$(df /home | tail -n 1 | awk '{print $5}' | sed 's/%//')

    # Si el uso de disco es mayor al 90%, enviamos correos electrónicos
    if [ $usage -gt 90 ]; then
        users=$(du -s /home/* | sort -nr | head -n 10 | cut -f2 | cut -d'/' -f3)

        for user in $users; do
            echo "Por favor, reduzca su uso de espacio en disco" | mail -s "Advertencia de uso de disco" $user
        done
    fi
fi

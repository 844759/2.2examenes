#!/bin/bash

# Comprueba si el número de argumentos es correcto
if [ $# -ne 4 ]; then
    echo "Número incorrecto de argumentos. Uso: $0 [temperatura_umbral] [duracion_monitorizacion] [intervalo_muestreo] [frecuencia_maxima]"
    exit 1
fi

temp_umbral=$1
duracion=$2
intervalo=$3
frecuencia_max=$4

# Comprobación de la frecuencia
max=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies | tr ' ' '\n' |  sort -n -t' ' | tail -n1)
if [ $frecuencia_max -gt $max ]
then
    echo "La frecuencia máxima proporcionada no es válida."
    exit 1
fi

# Comprobación de la duración e intervalo
if [ $(($duracion % $intervalo)) -ne 0 ] 
then
    echo "La duración debe ser múltiplo del intervalo de muestreo."
    exit 1
fi

# Monitorización de la temperatura y ajuste de la frecuencia
contador=0
suma_temp=0
i=0
while [ $i -lt $duracion ]
do

    sleep $intervalo
    temp_actual=$(cat /sys/class/thermal/thermal_zone0/temp)
    contador=$(($contador +1))
    suma_temp=$(($temp_actual + $suma_temp))

    temp_media=$(echo "scale=2; $suma_temp / $contador" | bc)

    if (( $(echo "$temp_media > $temp_umbral" | bc -l) )); then
        echo $frecuencia_max > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        echo "La temperatura media ($temp_media) ha excedido la temperatura umbral ($temp_umbral). Limitando la frecuencia máxima a $frecuencia_max."
    fi
    i=$(($i+$intervalo))
done

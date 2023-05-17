# Problemas Largos de ADSIS

## Ejercicio 1

Para la obtencion de aquellos procesos que lleven 24 horas ejecutandose habra que usar el comando: 

ps -eo pid,etimes

El cual muestra el pid y el tiempo en segundos de ejecuccion del script.

Para que el proceso se ejecute cada 24 horas habra que usar acron, para ello se modificara el fichero /etc/crontab, mediante:

@daily 5 cron.daily (test -x /etc/ej1.sh && /etc/ej1.sh > /dev/null 2>&1)

## Ejercicio 2

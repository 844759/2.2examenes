# Problemas Largos de ADSIS

## Ejercicio 1

Para la obtencion de aquellos procesos que lleven 24 horas ejecutandose habra que usar el comando: 

ps -eo pid,etimes

El cual muestra el pid y el tiempo en segundos de ejecuccion del script.

Para que el proceso se ejecute cada 24 horas habra que usar acron, para ello se modificara el fichero /etc/crontab, mediante:

@daily 5 cron.daily (test -x /etc/ej1.sh && /etc/ej1.sh > /dev/null 2>&1)

## Ejercicio 2

Para la realización de este script se usa md5sum, se calcula en la maquina introducida como parametro para comparar en la local, si el sum es igual entonces el fichero ya esta copiado, no hace falta hacer nada.

Se utiliza el comando scp para copiar el fichero de forma segura a la maquina destino, en caso de un directorio nos aseguramos que cada contenido en el sea un fichero y los vamos enviando.

## Ejercicio 3

Para la activación del servidor se ha de usar una nueva entrada en el fichero /etc/crontab, en el caso de activacion del servidor apache2 se usara:

0 9,16 * * 1-5 root (test -x /etc/ej3_act.sh && /etc/ej3_act.sh > /dev/null 2>&1)

En caso de parar el servicio de apache2 se usara: 

0 14,19 * * 1-5 root (test -x /etc/ej3_st.sh && /etc/ej3_st.sh > /dev/null 2>&1)

## Ejercicio 4

Para obtener la especificación adecuada se tendra que modificar el fichero crontab añadiendo la linea:

*/10 * * * * (test -x /etc/ej4.sh && /etc/ej4.sh > /dev/null 2>&1)


## Ejercicio 6

Para la realizacion de este script se ha de modificar el fichero /etc/crontab con la siguiente linea para la automatizacion del proceso:

59 23 * * * ( test -x ./ej6.sh && ./ej6.sh > /dev/null 2>&1)

## Ejercicio 7

He de mirar la integridad de los ficheros siempre?
Es más correcto guardar el estado mediante ps -e o leyendo su fichero de estado?

## Ejercicio 8

Para la modificacion de /etc/crontab deberemos añadir la linea:

14 3 * * * (test -x ./ej8_2.sh && ./ej8_2.sh > /dev/null 2>&1)

## Ejercicio 9 

Para la modificacion de /etc/crontab deberemos añadir la linea:

0 */1 * * * (test -x ./ej9.sh && ./ej9.sh > /dev/null 2>&1)

## Ejercicio 10

Para la modificacion de /etc/crontab deberemos añadir la linea:

0 6-23/2 * * * (test -x ./ej10.sh && ./ej10.sh > /dev/null 2>&1)

## Ejercicio 13
Para la modificacion de /etc/crontab deberemos añadir las lineas:

15 6 * 1-6 2 (test -x ./ej13.sh && ./ej13.sh > /dev/null 2>&1)

16 15 * 7-12 4 (test -x ./ej13.sh && ./ej13.sh > /dev/null 2>&1)

## Ejercicio 14

Para la modificacion de /etc/crontab deberemos añadir la linea:

37 7 */2 * * (test -x ./ej14.sh && ./ej14.sh > /dev/null 2>&1)

## Ejercicio 17

Para la modificacion de /etc/crontab deberemos añadir la linea:

*/20 * * * * (test -x ./ej17.sh && ./ej17.sh > /dev/null 2>&1)
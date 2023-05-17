# Problemas Cortos de ADSIS

## Ejercicio 1

En el script mostrado primro se declaran tres variables ONE con valor inicial 1, chet y FOX con valor inicial igual a 0.

A continuación hay un bucle con una condicion de que la variable brian tenga un valor de uno de los ficheros donde se localiza el script, con ./ seleccionamos todos los ficheros de la carpeta actual y con * cualquier caracter, es decir todos los archivos del directorio actual.

Posteriormente se muestra la variable brian y se mete en entrada estandar al comando grep el cual con el flag q simplemente esconde la salida resultante, despues si la salida del comando es igual a FOX es decir a 0, grep habra encontrado una coincidencia.

Dentro del if se asigna a la variable ramey el valor de brian, es decir de un archivo, posteriormente se declara una variable nueva n a la cual se le asigna el resultado de echo que muestra la variable ramey con un archivo y despues con sed se sustituye los espacios blancos por barras bajas, luego se hace un mv para cambiar el nombre al archivo y con chet contamos la cantidad de veces que se accede al if.

Despues se muestra la cantidad de archivos cambiados en el directorio actual y salimos con codigo 0.

## Ejercicio 2

El script asigna a una variable E_BADARGS un valor inicial de 85, con el flag -r del test dentro del if se comprueba que el fichero introducido como primer argumento sea legible, en caso de que no lo sea se muestra la forma en que el script se ejecuta y se sale con codigo de salida igual a 85.

Con el comando cat se muestra el interior del fichero que se ha introducido como parametro o parametros, con tr traducimos las mayusculas a minusculas, posteriormente todos los espacios en blanco los traducimos al caracter \012, el cual es un salto de linea, despues se realiza otro tr con el flag c el cual complementa el set 1 del comando, es decir todo lo que no sean saltos de linea y letras minusculas se sustituyen por saltos de linea, por ultimo con grep se eliminan lineas vacias, con sort se ordena alfabeticamente la lista de palabras obtenida y con uniq se retiran las lineas repetidas

## Ejercicio 3

Para la realizacion de este script los permisos que debe de tener el directorio .ssh, obteniendo los permisos de la siguiente manera ls -la /home/win | grep ".ssh$", si este script produce una salida con grep el usuario existira y los permisos se podran recoger con el comando anterior añadiendo | cut -c 1-4, de manera alternativa se puede comprobar cada uno de los permisos con comandos usando test.

Por convenio se utilizara el comando cat /etc/passwd | grep "$user" para saber si el usuario esta en el sistema o no, para ejecutar el script se necesitaran privilegios de administracion por ello la manera de ejecutarlo sera sudo ./ej3.sh users.txt.

## Ejercicio 4

El script asigna a dos variables un valor inicial, una variable FRANCES y ALLEN con valores 10 y 9 respectivamente, a la variable i se le asigna un valor aleatorio, despues en un if se pone como condicion que esta variable sea menor que la variable ALLEN con valor 9, si se entra en el if se muestra el valor de la variable.

El símbolo ./ indica que el archivo se encuentra en el directorio actual y $0 es una variable que almacena el nombre del archivo de script que se está ejecutando actualmente. Por lo tanto, ./$0 se traduce como "ejecuta el archivo de script actual en el directorio actual".

Por tanto el script se ejecuta en bucle hasta que i sea mayor igual a la variable allen.

## Ejercicio 5

Para la realizacion de este problema se usa el comando curl, el cual nos muestra el codigo html de una pagina web.

¿Dentro del temario?

## Ejercicio 6

Para la realizacion de este script, en la parte 2 se han tenido en cuenta las siguientes cosas:

El parámetro -mtime +30 en el comando find se utiliza para buscar archivos cuya última modificación haya ocurrido hace más de 30 días. El valor numérico que sigue al signo + indica la cantidad de días en el pasado.

En este caso, -mtime +30 filtra los archivos que no han sido modificados en los últimos 30 días (un mes aproximadamente). Al usar este parámetro con find, el comando devolverá una lista de archivos que cumplen con este criterio de antigüedad.

En el comando find se especifica -rf para añadir archivos a este y -cf para crearlo, se utiliza --files-from /dev/null, para especificar que el contenido del tar es inicialmente vacio, se usa este archivo para crealo puesto esta vacio, en la parte del exec {} representa el archivo que find encuentra y el \; indica que el comando -exec se ha completado.

## Ejercicio 7

Para la realizacion del script se necesita que en el comando passwd se le introduzca la constraseña dos veces, por ello el uso del comando echo -e "$2\n$2" que se comunica con passwd a traves de una pipe

Linux dispone de un mecanismo más sofisticado, denominado PAM, en el cual se puede establecer diferentes normas para la creacion de contraseñas en el sistema, ejemplo de ello: 

password requisite pam_passwdqc.so min=12,10,10,8,6 retry=3

Diap(Control de Accesos nº21)

## Ejercicio 8

Para el ejercicio 8 simplemente se podria hacer con un solo comando grep, el cual muestra las lineas que cumplen que tiene una terminal bash.

## Ejercicio 9

Para este ejercicio se ha usado el concepto del anterior, para ello recogemos primero la shell y despues buscamos cada usuario con esa shell.

## Ejercicio 10

Para el siguiente ejercicio se ha leido el fichero .bash_history localizado en el directorio del usuario y el cual contiene el historial de los comandos ejecutados en terminal por el usuario del home.

## Ejercicio 11

Para el ejercicio 11 se ha usado la herramienta ping -w 5 cuyo comportamiento se especifica en un comentario, además se usa grep en hosts para saber si el ip y el host existen actualmente en el fichero.

## Ejercicio 12

Para la realización del script se ha utilizado un fichero de texto, puesto que traceroute produce diversos timeouts, por ello se mete una salida del comando por entrada estandar. En cuanto comentarios a destacar para el procesamiento del problema realizado, se utiliza la linea para calcular la media:

avg_rtt=$(echo "scale=3; ($v1 + $v2 + $v3) / 3" | bc)

En el comando se pone echo scale=3, esto es debido a que si no se indica muestra los numeros enteros, es decir si tenemos 3.14, muestra 3, por ello hay que indicar el numero de decimales que se usara bc, introduciendo de esta manera la operacion ("scale=3; ($v1 + $v2 + $v3) / 3") a realizar para la calculadora bc, a la cual se le introducen operaciones matematicas.

Se utiliza la siguiente linea para usar un array de valores calculados:

rtt[$nodos]=$(echo "$ip: $avg_rtt")

Para cada valor de $nodos se añade una entrada distinta, para más tarde usar un bucle for (for nodos in "${!rtt[@]}") en el cual se iterara por cada componente del array.

Mas tarde se usa:

| sort -rn -k3 | head -n5

En la salida del bucle for para meter en entrada estandar lo impreso en este y ordenar los distintos elementos numericamente.

## Ejercicio 13

Falta al ssh decirle que falta el entorno interactivo no funcionaria cmd...

## Ejercicio 14

Podria fallar porque se usa mv sin los archivos entre comillados, esto puede acusar que se lea un archivo como por ejemplo "prob\ a.txt" el cual tiene nombre prob a.txt, pero el comando mv no seria capaz de interpretarlo sin las comillas.

arreglo: mv "$source_file" "$destination_file"

## Ejercicio 15

El resultado obtenido sera una llamada a f con un argumento, la clausula del if se cumplira, por ello se mostrara hello, pero como esta llamada a la funcion f esta concatenada mediante una pipe a una segunda llamada, entonces se realiza la segunda llamada metiendole por entrada estandar la salida de la anterior llamada.

En este caso la clausula del if no se cumplira y nos meteremos en el else, una vez alli leeremos una linea de la entrada mediante read metiendolo en una variable nueva var, para posteriormente mostrar hello por la salida del programa.

Posteriormente mostrara hello mediante un echo de la variable var pero no la guardara de la ejecuccion de f, por ello simplemente mostrara una linea vacia por pantalla.

## Ejercicio 16

La condicion del if es de forma literal, es decir se busca un string que tenga la forma de re, por ello no se va a cumplir nunca, para corregirlo habria que usar grep y more para mostrar el contenido del archivo, por otro lado el for iteraria por archivos que pueden ser directorios pero no ficheros y que se llamen de forma dir.txt, hay que comprobar primero que es un fichero.

Cabe destacar que para usar =~ para expresiones regulares hay que usar doble corchete de la forma: [[ $file =~ $re ]], es necesario poner re sin comillas puesto lo pillara como un string literal.

## Ejercicio 17

La configuracion de iptables definida utiliza la tabla filter de iptables, con la cadena INPUT, estamos aceptando todo el trafico externo al host, con la cadena FORWARD estamos destinando los paquetes a otra interfaz y con la cadena OUTPUT estamos aceptando cualquier salida de paquetes, es decir no hay ninguna regla definida para ninguna de las opciones por defecto.

## Ejercicio 18

Tal y como se puede ver en el firewall expuesto tenemos tres interfaces eth0, eth1 y loopback, al principio del script se borran las reglas que iptables tenian definidas y se restablece iptables, posteriormente mediante -P se retiran todas las politicas por defecto que habia en iptables para establecer las nuestras propias, mediante echo vamos modificando los flags necesarios de ip_fordward y demás flags necesarios.

Posteriormente se permite todo el trafico de la interfaz loopback, posteriormente mediante el uso de -m conntrack --cstate ESTABLISHED,RELATED se permite el trafico de conexiones ya establecidas, más tarde todo paquete que se encuentre en un estado invalido se rechaza mediante -m conntrack --ctstate INVALID -j DROP.

Posteriormente todas las conexiones ssh que se realicen detras del firewall son aceptadas mediante:

iptables -A INPUT -i eth1 -s 192.168.0.0/24 \
-p tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT

Despues se aceptan todas las conexiones a internet a traves de la interfaz eth0, usando el comando:

iptables -A OUTPUT -o eth0 -d 0.0.0.0/0 -j ACCEPT

Detras del firewall se permite el acceso a internet del trafico interno a la red LAN.

La razón por la que hay que poner MASQUERADE es porque tenemos un protocolo DHCP, es decir una ip dinamica, esto es porque los demás dispositivos para acceder a internet deben pasar por la interfaz eth0, si no se pusiera MASQUERADE entonces solo el dispositivo que tiene el firewall seria capaz de acceder a internet.

## Ejercicio 19

La diferencia entre SNAT y MASQ, es que SNAT cambia la dirección origen del paquete, mientras que MASQ es un tipo de SNAT usado para la asignación dinamica de IPS.

## Ejercicio 20

iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --set

iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --update --seconds 60 --hitcount 16 -j DROP

Estas dos reglas trabajan juntas para limitar las conexiones nuevas al puerto 80 a no más de 15 por minuto desde una misma dirección IP.

    -A INPUT: Este comando añade una nueva regla al final de la cadena INPUT. El tráfico entrante será procesado por esta cadena.

    -p tcp --dport 80: Estas opciones restringen la regla para que sólo se aplique a los paquetes TCP destinados al puerto 80, que es el puerto por defecto para el tráfico HTTP.

    -m state --state NEW: Estas opciones hacen que la regla sólo se aplique a las nuevas conexiones. iptables mantiene un seguimiento del estado de las conexiones, y esta opción permite que la regla se aplique sólo a los paquetes que están iniciando una nueva conexión.

    -m recent --set: Esta opción añade la dirección IP de origen del paquete a la lista de direcciones recientes.

    -m recent --update --seconds 60 --hitcount 16: Esta opción actualiza la marca de tiempo de la dirección IP de origen si está en la lista de direcciones recientes y ha enviado 16 o más paquetes en los últimos 60 segundos.

    -j DROP: Esta opción especifica la acción a tomar si un paquete coincide con la regla. En este caso, el paquete será descartado y no se enviará ninguna respuesta al emisor.

Con estas reglas en su lugar, cualquier dirección IP que intente iniciar más de 15 nuevas conexiones al puerto 80 en un minuto será bloqueada por el resto de ese minuto.

## Ejercicio 21

Para añadir el script para que lo haga en la periocidad indicada mediante cron, tendremos que editar el fichero /etc/crontab añadiendo la siguiente linea:

*/5 10 * * 1-2 /etc/ej21.sh

Se pone */5 para que se ejecute cada 5 minutos en la hora 10 de lunes a martes 1-2.

Como aditivos a este problema se puede poner un fichero de salida que vaya mostrando la salida del programa redirigiendo su salida a un txt y su salida de error a la salida estandar. Además habra que comprobar primero que el script tiene permisos de ejecucion con test -x:

(test -x /etc/ej21.sh && /etc/ej21.sh > salida.txt 2>&1)

No se le pasa el ejecutable como tal, se le pasa la localización del script.

## Ejercicio 22

Como la maquina que se usa para la ejecucion del script no estara siempre encendida se usara acron en vez de cron para la ejecuccion de este comando.

@daily 5 cron.daily (test -x /etc/ej22.sh && /etc/ej22.sh > /dev/null 2>&1)

## Ejercicio 23

El programa empieza mostrando el valor inicial de las variables var0 y var1, cuyo valor es 0 y 1 respectivamente, posteriormente se hace una llamada a funcion f_var0 y f_var1, primero llamando f_var0, se muestra el valor de var0 el cual es un 0 y despues se le asigna un string "zero" mostrandolo tambien.

Se ejecuta f_var1 mostrando un 1 y posteriormente "one", se vuelve a mostrar con los valores actualizados, despues se asgina un nuevo valor a var0 y var1, la diferencia es que al entrar en sub_shell los valores nuevos introducidos por las funciones no se actualizaran mostrando al final los valores con los que se llamo a las funciones.

## Ejercicio 24

Inicialmente se ejecuta un comando tar con las opciones cj para todo archivo html que se encuentre en el directorio, despues de envia ese archivo tar con una pipe a una maquina mediante ssh descomprimiendo este con las opciones xj.

## Ejercicio 25

El script expuesto asigna a la var1 un string "grace" y declara otra variable var2 con un sttring "hopper", posteriormente con /bin/bash -c se ejecuta el comando entrecomillado mostrando -hopper y posteriormente muestra grace-hopper.

Al poner \$var1, lo que estamos haciendo es evitar la expansion de variables, lo que significa que la variable 1 no se exportara a no ser que pongamos export en su definicion.

## Ejercicio 26

El siguiente script esta ejecutando el mismo script que se llamo con el argumento $0 y esta metiendo el resultado por una pipe a una segunda ejecuccion de este script con & ejecutandolo en segundo plano, lo que podria producir un bucle infinito de llamadas creando infinitos sub_procesos zombie.

## Ejercicio 27

Los problemas sucedidos de la ejecuccion de este comando:

cat $(find . -type f) > ../contenido_ficheros.txt

Si los ficheros a encontrar tienen huecos vacios al intentar mostrarlos con cat, este no los encontrara.

Si hay demasiados archivos no se encontraran todos debido a la longitud de linea.


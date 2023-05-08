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

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

# 2016-2-0

## Ej 1

El programa A indicado en el enunciado no compila adecuadamente, puesto que en la funcion mar no existe una funcion adecuada para sumar char*, es decir habria que sobreescribir el operador +.

foo.h:8:10: error: invalid operands of types ‘const char*’ and ‘const char* const’ to binary ‘operator+’
    8 |    {  t=t+t2;   }
      |         ~^~~

El programa B indicado en el enunciado, no compilaria adecuadamente, el programa está tratando de instanciar un objeto Foo en main.cc, que no es posible ya que Foo es una clase abstracta (tiene al menos un método virtual puro).

main.cc:8:23: error: invalid new-expression of abstract class type ‘Foo’
    8 |   f = new Bar(new Foo());

## Ej 2

a) Es la cacteristica de un lenguaje de programación que permite que un elemento del codigo pueda representar distintos elementos del lenguaje a lo largo de su ejecucción.

b) El polimorfismo por inclusion es una tecnica que dice que si hay alguna relacion de subtipados entre una clase base y sus clases hijas, se puede definir codigo que trabaje con la clase base y sus hijas.

**Polimorfismo por inclusion:**

Un puntero (referencia) de la clase padre puede estar representando a cualquiera de sus clases hijas. Tambien las clases derivadas pueden referenciar metodos de la clase padre y redefinir su comportamiento mediante herencia.

**Polimorfismo parametrico:**

Permite escribir codigo que opera de la misma forma con distintos tipos de datos, sin que tengan que ver con la herencia. Tambien permite escribir codigo reutilizable independientemente del tipo de dato que se va a usar.

c) Diversos ejemplos en la carpeta correspondiente

d) Comentarios en los ejemplos expuestos

e) 


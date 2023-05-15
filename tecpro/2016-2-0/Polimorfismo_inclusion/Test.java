class Animal {
    public void sonido() {
        System.out.println("El animal hace un sonido");
    }
}

class Perro extends Animal {
    public void sonido() {
        System.out.println("El perro ladra");
    }
}

class Gato extends Animal {
    public void sonido() {
        System.out.println("El gato maúlla");
    }
}

public class Test {
    public static void main(String[] args) {
        Animal miAnimal = new Animal(); // La clase principal define punteros a sus clases hijas
        Animal miPerro = new Perro();   // Un puntero de la clase principal por tanto puede estar referenciando a cualquiera de sus subclases.
        Animal miGato = new Gato();

        miAnimal.sonido();  // Imprime: "El animal hace un sonido" Estas subclases redefinen el metodo de la clase padre
        miPerro.sonido();  // Imprime: "El perro ladra"
        miGato.sonido();  // Imprime: "El gato maúlla"
    }
}

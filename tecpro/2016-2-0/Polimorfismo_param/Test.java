// Polimorfismo por inclusión
abstract class Animal {
    abstract void hacerSonido();
}

class Perro extends Animal {
    void hacerSonido() {
        System.out.println("Guau!");
    }
}

class Gato extends Animal {
    void hacerSonido() {
        System.out.println("Miau!");
    }
}

// Polimorfismo paramétrico
class Caja<T> {
    private T contenido;

    public void guardar(T contenido) {
        this.contenido = contenido;
    }

    public T obtener() {
        return contenido;
    }
}

public class Test {
    public static void main(String[] args) {
        // Polimorfismo por inclusión
        Animal miAnimal = new Gato();
        miAnimal.hacerSonido(); // Imprime "Miau!"

        miAnimal = new Perro();
        miAnimal.hacerSonido(); // Imprime "Guau!"

        // Polimorfismo paramétrico
        Caja<Animal> cajaAnimal = new Caja<>();
        cajaAnimal.guardar(new Gato());
        cajaAnimal.obtener().hacerSonido(); // Imprime "Miau!"
    }
}

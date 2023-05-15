#include "Shape.h"
class Square : public Shape {
    float side;

    Square(float s) : side(s) {}

    float area() const { // Redifinicion de los metodos de la clase padre
        return side*side;
    }

    float perimeter() const { // Redifinicion de los metodos de la clase padre
        return 4*side;
    }
};
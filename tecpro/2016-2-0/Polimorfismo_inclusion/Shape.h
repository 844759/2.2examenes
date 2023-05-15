
class Shape {
public:
    virtual float area() const {
        return 0;
    }
    virtual float perimeter() const {
       return 0;
    }
};

float aspect_ratio(const Shape& s) // Como parametro se pasa un puntero a la clase padre que 
{                                  // puede referenciar a cualquiera de sus clases hijas
    return s.area()/s.perimeter(); // Se aplica el metodo a cualquiera de sus hijas, incluso aunque estas no lo definan
}
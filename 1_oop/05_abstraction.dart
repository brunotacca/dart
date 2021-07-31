abstract class GeometricForm {
  num area(); // Abstract method

  String type() {
    return 'Unknown';
  }
}

class Retangle implements GeometricForm {
  num width, height;

  Retangle(this.width, this.height);

  // Mandatory due to abstract class defining it as an abstract method.
  num area() {
    return this.width * this.height;
  }

  // Mandatory because Retangle is IMPLEMENTING the GeometricForm abstract class.
  String type() {
    return 'Retangle';
  }
}

class Square extends GeometricForm {
  num width = 0, height = 0;

  Square(num dimension) {
    this.width = dimension;
    this.height = dimension;
  }

  // Implementation mandatory due to abstract class defining it as an abstract method.
  num area() {
    return this.width * this.height;
  }

  // OPTIONAL because Square is EXTENDING the GeometricForm abstract class.
  // ... AND also because type() is NOT an abstract method.
  // String type() {
  //   return 'Square';
  // }
}

class AmazingPDFPrinter {
  static String render(GeometricForm geoObject) {
    return 'The area of the ' +
        geoObject.type() +
        ' is ' +
        geoObject.area().toString();
  }
}

void main() {
  GeometricForm objSquare = new Square(3);
  GeometricForm objRetangle = new Retangle(3, 4);

  print(AmazingPDFPrinter.render(objSquare));
  print(AmazingPDFPrinter.render(objRetangle));
}

import 'GeometricForm.dart';

class Square extends GeometricForm {
  num width, height;

  Square(num side) {
    this.width = side;
    this.height = side;
  }

  num area() {
    return this.width * this.height;
  }
}

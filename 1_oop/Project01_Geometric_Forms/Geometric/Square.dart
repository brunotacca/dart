import 'GeometricForm.dart';

class Square extends GeometricForm {
  num width = 0, height = 0;

  Square(num side) {
    this.width = side;
    this.height = side;
  }

  num area() {
    return this.width * this.height;
  }
}

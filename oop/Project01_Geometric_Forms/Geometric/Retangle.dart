import 'GeometricForm.dart';

class Retangle extends GeometricForm {
  num width, height;

  Retangle(this.width, this.height);

  num area() {
    return this.width * this.height;
  }
}

import 'GeometricForm.dart';
import 'dart:math';

class Circle extends GeometricForm {
  num radius;

  Circle(this.radius);

  num area() {
    return pow(this.radius, 2) * pi;
  }
}

import 'Geometric/GeometricForm.dart';
import 'Geometric/Square.dart';
import 'Geometric/Retangle.dart';
import 'Geometric/Circle.dart';
import 'AmazingPDFPrinter.dart';

void main() {
  GeometricForm objSquare = new Square(3);
  GeometricForm objRetangle = new Retangle(3, 4);
  GeometricForm objCircle = new Circle(3);

  objSquare.type = 'Square';
  objRetangle.type = 'Retangle';
  objCircle.type = 'Circle';

  objCircle.anyString = 'Round thing?';

  print(AmazingPDFPrinter.render(objSquare));
  print(AmazingPDFPrinter.render(objRetangle));
  print(AmazingPDFPrinter.render(objCircle));
}

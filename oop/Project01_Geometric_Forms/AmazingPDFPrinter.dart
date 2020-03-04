import 'Geometric/GeometricForm.dart';

class AmazingPDFPrinter {
  static String render(GeometricForm objGeoForm) {
    return 'The area of the ' +
        objGeoForm.type +
        ' is ' +
        objGeoForm.area().toString();
  }
}

abstract class GeometricForm {
  String anyString = "Form";
  num area();

  String get type => this.anyString;
  set type(String type) {
    this.anyString = type;
  }
}

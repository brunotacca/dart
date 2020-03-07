main() {

  var one = int.parse('1');
  assert(one == 1);
  print(one == 1);

  var oneDouble = double.parse('1.0');
  assert(oneDouble == 1.1);
  print(oneDouble == 1.0);

  String onAsString = 1.toString();
  print(onAsString);

  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);

}
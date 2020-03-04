void main() {
  print('https://dart.dev/guides/language/language-tour');
  main2();
  main3();
  main4();
}

/*
Enumerated types
Enumerated types, often called enumerations or enums, are a special kind of class used to represent a fixed number of constant values.

Using enums
Declare an enumerated type using the enum keyword:
*/
enum Color { red, green, blue }
/*
Each value in an enum has an index getter, which returns the zero-based position of the value in the enum declaration. For example, the first value has index 0, and the second value has index 1.
*/
main2() {
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);
}

/*
To get a list of all of the values in the enum, use the enum’s values constant.
*/
main3() {
  List<Color> colors = Color.values;
  assert(colors[2] == Color.blue);
}

/*
You can use enums in switch statements, and you’ll get a warning if you don’t handle all of the enum’s values:
*/
main4() {
  var aColor = Color.blue;

  switch (aColor) {
    case Color.red:
      print('Red as roses!');
      break;
    case Color.green:
      print('Green as grass!');
      break;
    default: // Without this, you see a WARNING.
      print(aColor); // 'Color.blue'
  }
}
/*
Enumerated types have the following limits:

You can’t subclass, mix in, or implement an enum.
You can’t explicitly instantiate an enum.
For more information, see the Dart language specification.
*/

void main() {
  print('-------------------------------------');
  print('final and const');
  print('-------------------------------------');

  // can add/remove from this list, but cannot assign a new list to fruit.
  final fruit = ["apple", "pear", "orange"];
  fruit.add("grape");
  print(fruit);

  // cannot mutate the list or assign a new list to cars.
  final cars = const ["Honda", "Toyota", "Ford"];
  // cars.add("Fiat"); // RunTime error
  print(cars);

  // const requires a constant assignment, whereas final will accept both:
  const names = const ["John", "Jane", "Jack"];
  // names = ["Tacca", "Tacca", "Tacca"]; // Error
  // names.add("Tacca"); // RunTime error
  print(names);

  // var or dynamic
  print('-------------------------------------');
  print('var and dynamic');
  print('-------------------------------------');

  String name2;
  //name2 = 33; // error
  print(name2);
  name2 = 'Tacca'; // ok
  print(name2);

  print('-------------------------------------');
  print('var');
  print('-------------------------------------');
  var name;
  name = 33; // ok
  print(name.toString() + " : " + name.runtimeType.toString());

  name = {
    'name': 'Tacca',
    'age': 33,
    'weight': 75.5,
    'isAdm': true,
    18: 'eighteen'
  };
  print(name.toString() + " : " + name.runtimeType.toString());
  name = 'Tacca'; // ok
  print(name.toString() + " : " + name.runtimeType.toString());

  print('-------------------------------------');
  print('dynamic');
  print('-------------------------------------');
  dynamic user;
  user = 33; // ok
  print(user.toString() + " : " + user.runtimeType.toString());

  user = {
    'name': 'Tacca',
    'age': 33,
    'weight': 75.5,
    'isAdm': true,
    18: 'eighteen'
  };
  print(user.toString() + " : " + user.runtimeType.toString());
  user = 'Tacca'; // ok
  print(user.toString() + " : " + user.runtimeType.toString());

  print('-------------------------------------');

  dynamic v1 = 123; // v is of type int.
  v1 = 456; // changing value of v from 123 to 456.
  v1 = 'abc'; // changing type of v from int to String.
  print(v1.toString() + " : " + v1.runtimeType.toString());

  var v2 = 123; // v is of type int.
  v2 = 456; // changing value of v from 123 to 456.
  //v2 = 'abc'; // ERROR: can't change type of v from int to String.
  print(v2.toString() + " : " + v2.runtimeType.toString());

  print('-------------------------------------');
  print('var defines the type if initialized. If not it stays dynamic.');
  print('-------------------------------------');
  print('dynamic is a type underlying all Dart objects.');
  print(
      'var is a keyword. Dart will replace the var keyword with the initializer type, or leaving it dynamic by default if there is no initializer.');
  print('-------------------------------------');
}

main() {

  List<String> names = ['Jack', 'Jill'];
  var names2 = names; // points to names;

  names.forEach((str) => print(str));
  print('');

  names2.add('John'); // adding on names2 means adding on names.

  names.forEach((str) => print(str));
  print('');

  // Spread opperator makes a copy of the object.
  names2 = [...names];

  names2.add('Mary'); // diferent objects now.
  names.forEach((str) => print(str));
  print('');
  names2.forEach((str) => print(str));

}
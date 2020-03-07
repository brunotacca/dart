import 'dart:math';

void main() {
  hello('Bruno');
  hello('Bruno', 18, 'Tacca');
  hello('Bruno');
  hello('Tacca');
  hello('Bruno Tacca');
  hello('...');

  doPrint(square(2));
  doPrint(square(2.2));

  print(square.runtimeType); // (dynamic) => dynamic

  doPrint(sqrt(2));
  print(sqrt.runtimeType); // (dynamic) => dynamic

  // Annonymous function
  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((i) {
    print(i);
  });
}

void hello(String name, [int age = 0, String surname]) {
  var msg = 'Hello ' + name;
  if (surname != null) {
    msg = msg + ' ' + surname;
  }

  msg = msg + ', Age: ' + age.toString();
  print(msg);
}

dynamic square(var num) {
  return num * num;
}

void doPrint(var msg) {
  print(msg);
}

// Arrow Function => Shortcut to declare function.
dynamic sqrt(var num) => pow(num, 2);

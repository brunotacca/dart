class Greet {
  String msg;
  void sayHello(String name, {int age: 0, String surname}) {
    msg = 'Hello ' + name;

    if (surname != null) {
      msg = msg + ' ' + surname;
    }

    if (age > 0) {
      msg = msg + ', you are ' + age.toString() + ' years old';
    }

    print(msg);
  }

  void sayBonjour(String name, [String surname, int age = 0]) {
    msg = 'Bonjour ' + name;

    if (surname != null) {
      msg = msg + ' ' + surname;
    }

    if (age > 0) {
      msg = msg + ', vous avez ' + age.toString() + ' ans';
    }

    print(msg);
  }
}

void main() {
  var greetings = new Greet();

  greetings.sayHello('Bruno', age: 30, surname: 'Tacca');
  greetings.sayHello('Bruno');
  greetings.sayHello('Bruno', age: 30);
  greetings.sayHello('Bruno', surname: 'Tacca');

  greetings.sayBonjour('Bruno', 'Tacca', 30);
  greetings.sayBonjour('Bruno');
  // greetings.sayBonjour('Bruno', 30); // ERROR Positional Parameters
  greetings.sayBonjour('Bruno', 'Tacca');
}

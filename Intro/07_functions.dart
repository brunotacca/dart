void main() {
  hello('Bruno');
  hello('Bruno', 18, 'Tacca');
  hello('Bruno');
  hello('Tacca');
  hello('Bruno Tacca');
  hello('...');
}

void hello(String name, [int age = 0, String surname]) {
  var msg = 'Hello ' + name;
  if (surname != null) {
    msg = msg + ' ' + surname;
  }

  msg = msg + ', Age: ' + age.toString();
  print(msg);
}

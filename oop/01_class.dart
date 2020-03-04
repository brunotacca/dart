class Person {
  String firstName, lastName;

  Person(this.firstName, this.lastName);

  String toString() {
    return this.firstName + ' ' + this.lastName;
  }
}

void main() {
  Person bruno1 = new Person('Bruno', 'Tacca');
  Person bruno2 = new Person('Bruno', 'Vitorelli');

  print(bruno1);
  print(bruno2);
}
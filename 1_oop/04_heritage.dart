class Person {
  String firstName, lastName;

  Person(this.firstName, this.lastName);

  String fullName() {
    return this.firstName + ' ' + this.lastName;
  }
}

class Employee extends Person {
  double salary;

  Employee(String firstName, String lastName, this.salary)
      : super(firstName, lastName);

  void riseSalary(double value) {
    this.salary += value;
  }
}

class Employee2 {
  static const double salary = 25000.0;

  static void riseSalary(double value) {
    // salary += value; // ERROR Constant variables can't be assigned a value.
  }
}

void main() {
  var bruno = Employee('Bruno', 'Tacca', 25000.0);
  print(bruno.fullName());
  print(bruno.salary);
  bruno.riseSalary(5000.50);
  print(bruno.salary);

  // Employee2.salary = 25000.0; // ERROR Constant variables can't be assigned a value.
  Employee2.riseSalary(5000.0);
  print(Employee2.salary);
}

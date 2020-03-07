void main() {
  print('https://dart.dev/guides/language/language-tour');
}

/* Abstract classes
Use the abstract modifier to define an abstract class—a class that can’t be instantiated. Abstract classes are useful for defining interfaces, often with some implementation. If you want your abstract class to appear to be instantiable, define a factory constructor.
Abstract classes often have abstract methods. Here’s an example of declaring an abstract class that has an abstract method:
*/
// This class is declared abstract and thus can't be instantiated.
abstract class AbstractContainer {
  // Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}

/* Abstract methods
Instance, getter, and setter methods can be abstract, defining an interface but leaving its implementation up to other classes. Abstract methods can only exist in abstract classes.
To make a method abstract, use a semicolon (;) instead of a method body:
*/

abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}

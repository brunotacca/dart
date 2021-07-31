import 'dart:math';

void main() {
  print('https://dart.dev/guides/language/language-tour');

/*
Dart is an object-oriented language with classes and mixin-based inheritance. Every object is an instance of a class, and all classes descend from Object. Mixin-based inheritance means that although every class (except for Object) has exactly one superclass, a class body can be reused in multiple class hierarchies. Extension methods are a way to add functionality to a class without changing the class or creating a subclass.

Using class members
Objects have members consisting of functions and data (methods and instance variables, respectively). When you call a method, you invoke it on an object: the method has access to that object’s functions and data.
Use a dot (.) to refer to an instance variable or method:
*/

  var p = Point(2, 2);

// Set the value of the instance variable y.
  p.y = 3;

// Get the value of y.
  assert(p.y == 3);

// Invoke distanceTo() on p.
  num distance = p.distanceTo(Point(4, 4));
  print(distance);
/*
Use ?. instead of . to avoid an exception when the leftmost operand is null:
*/
  // If p is non-null, set its y value to 4.
  p?.y = 4;

/*
Using constructors
You can create an object using a constructor. Constructor names can be either ClassName or ClassName.identifier. For example, the following code creates Point objects using the Point() and Point.fromJson() constructors:
*/
  var p1 = Point(2, 2);
  var p2 = Point.fromJson({'x': 1, 'y': 2});
  print(p1.toString() + ' ' + p2.toString());

/*
The following code has the same effect, but uses the optional new keyword before the constructor name:
*/
  var p11 = new Point(2, 2);
  var p21 = new Point.fromJson({'x': 1, 'y': 2});
  print(p11.toString() + ' ' + p21.toString());

/*
Some classes provide constant constructors. To create a compile-time constant using a constant constructor, put the const keyword before the constructor name:
*/

  var pp = const ImmutablePoint(2, 2);
  print(pp.toString());

/*
Constructing two identical compile-time constants results in a single, canonical instance:
*/
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);

  assert(identical(a, b)); // They are the same instance!

/*
Within a constant context, you can omit the const before a constructor or literal. For example, look at this code, which creates a const map:
*/
// Lots of const keywords here.
  const pointAndLine = const {
    'point': const [const ImmutablePoint(0, 0)],
    'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
  };

  print(pointAndLine);

/*
You can omit all but the first use of the const keyword:
*/
// Only one const, which establishes the constant context.
  const pointAndLine2 = {
    'point': [ImmutablePoint(0, 0)],
    'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
  };

  print(pointAndLine2);

/*
If a constant constructor is outside of a constant context and is invoked without const, it creates a non-constant object:
*/
  var a2 = const ImmutablePoint(1, 1); // Creates a constant
  var b2 = ImmutablePoint(1, 1); // Does NOT create a constant

  assert(!identical(a2, b2)); // NOT the same instance!

/*
Getting an object’s type
To get an object’s type at runtime, you can use Object’s runtimeType property, which returns a Type object.
*/
  print('The type of a is ${a.runtimeType}');

// Up to here, you’ve seen how to use classes. The rest of this section shows how to implement classes.
  main2();
  main3();
  main4();
  main5();
  main6();
  main7();
}

/* Instance variables
Here’s how you declare instance variables:
class Point {
  num x; // Declare instance variable x, initially null.
  num y; // Declare y, initially null.
  num z = 0; // Declare z, initially 0.
}

All uninitialized instance variables have the value null.
All instance variables generate an implicit getter method. Non-final instance variables also generate an implicit setter method. For details, see Getters and setters.

class Point {
  num x;
  num y;
}
*/

class Point2 {
  num? x;
  num? y;
}

void main2() {
  var point = Point2();
  point.x = 4; // Use the setter method for x.
  assert(point.x == 4); // Use the getter method for x.
  assert(point.y == null); // Values default to null.
/*
If you initialize an instance variable where it is declared (instead of in a constructor or method), the value is set when the instance is created, which is before the constructor and its initializer list execute.
*/
}

/*
Constructors
Declare a constructor by creating a function with the same name as its class (plus, optionally, an additional identifier as described in Named constructors). The most common form of constructor, the generative constructor, creates a new instance of a class:

class Point {
  num x, y;

  Point(num x, num y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y;
  }
}
The this keyword refers to the current instance.
Note: Use this only when there is a name conflict. Otherwise, Dart style omits the this.
*/

/*
The pattern of assigning a constructor argument to an instance variable is so common, Dart has syntactic sugar to make it easy:

class Point {
  num x, y;

  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  Point(this.x, this.y);
}
*/

/*
Default constructors
If you don’t declare a constructor, a default constructor is provided for you. The default constructor has no arguments and invokes the no-argument constructor in the superclass.

Constructors aren’t inherited
Subclasses don’t inherit constructors from their superclass. A subclass that declares no constructors has only the default (no argument, no name) constructor.

Named constructors
Use a named constructor to implement multiple constructors for a class or to provide extra clarity:

class Point {
  num x, y;

  Point(this.x, this.y);

  // Named constructor
  Point.origin() {
    x = 0;
    y = 0;
  }
}
Remember that constructors are not inherited, which means that a superclass’s named constructor is not inherited by a subclass. If you want a subclass to be created with a named constructor defined in the superclass, you must implement that constructor in the subclass.
*/
/*
Invoking a non-default superclass constructor
By default, a constructor in a subclass calls the superclass’s unnamed, no-argument constructor. The superclass’s constructor is called at the beginning of the constructor body. If an initializer list is also being used, it executes before the superclass is called. In summary, the order of execution is as follows:

initializer list
superclass’s no-arg constructor
main class’s no-arg constructor
If the superclass doesn’t have an unnamed, no-argument constructor, then you must manually call one of the constructors in the superclass. Specify the superclass constructor after a colon (:), just before the constructor body (if any).

In the following example, the constructor for the Employee class calls the named constructor for its superclass, Person. Click Run to execute the code.
*/

class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

main3() {
  var emp = new Employee.fromJson({});

  // Prints:
  // in Person
  // in Employee
  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }
  // (emp as Person).firstName = 'Bob'; // Unnecessary cast
  emp.firstName = 'Bob';
}
/*
Because the arguments to the superclass constructor are evaluated before invoking the constructor, an argument can be an expression such as a function call:

class Employee extends Person {
  Employee() : super.fromJson(defaultData);
  // ···
}
*/

class Employee2 extends Person {
  Employee2() : super.fromJson({});
}

main4() {
  var emp = new Employee2();
  print(emp);
}

/*
Initializer list
Besides invoking a superclass constructor, you can also initialize instance variables before the constructor body runs. Separate initializers with commas.

// Initializer list sets instance variables before
// the constructor body runs.
Point.fromJson(Map<String, num> json)
    : x = json['x'],
      y = json['y'] {
  print('In Point.fromJson(): ($x, $y)');
}
*/

/*
During development, you can validate inputs by using assert in the initializer list.

Point.withAssert(this.x, this.y) : assert(x >= 0) {
  print('In Point.withAssert(): ($x, $y)');
}
*/

/*
Initializer lists are handy when setting up final fields. The following example initializes three final fields in an initializer list. Click Run to execute the code.
import 'dart:math';

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

main() {
  var p = new Point(2, 3);
  print(p.distanceFromOrigin);
}
*/

class Point5 {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point5(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

main5() {
  var p = new Point5(2, 3);
  print(p.distanceFromOrigin);
}

/*
Redirecting constructors
Sometimes a constructor’s only purpose is to redirect to another constructor in the same class. A redirecting constructor’s body is empty, with the constructor call appearing after a colon (:).

class Point {
  num x, y;

  // The main constructor for this class.
  Point(this.x, this.y);

  // Delegates to the main constructor.
  Point.alongXAxis(num x) : this(x, 0);
}
*/

/*
Constant constructors
If your class produces objects that never change, you can make these objects compile-time constants. To do this, define a const constructor and make sure that all instance variables are final.

class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

Constant constructors don’t always create constants. For details, see the section on using constructors.
*/

/*
Factory constructors
Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class. For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype.

The following example demonstrates a factory constructor returning objects from a cache:
*/
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

/*
Note: Factory constructors have no access to this.
Invoke a factory constructor just like you would any other constructor:
*/
main6() {
  var logger = Logger('UI');
  logger.log('Button clicked');
}

/*
Methods
Methods are functions that provide behavior for an object.

Instance methods
Instance methods on objects can access instance variables and this. The distanceTo() method in the following sample is an example of an instance method:

import 'dart:math';

class Point {
  num x, y;

  Point(this.x, this.y);

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}
*/
/*
Getters and setters
Getters and setters are special methods that provide read and write access to an object’s properties. Recall that each instance variable has an implicit getter, plus a setter if appropriate. You can create additional properties by implementing getters and setters, using the get and set keywords:
*/

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

void main7() {
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}
// With getters and setters, you can start with instance variables, later wrapping them with methods, all without changing client code.

class Point {
  num x = 0, y = 0;

  Point(this.x, this.y);

  // Named constructor
  Point.origin() {
    x = 0;
    y = 0;
  }

  Point.fromJson(Map<String, num> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

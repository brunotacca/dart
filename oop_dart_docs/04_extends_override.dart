void main() {
  print('https://dart.dev/guides/language/language-tour');
  main2();
}

/*
Here’s an example of specifying that a class implements multiple interfaces:

class Point implements Comparable, Location {...}
*/

/*
Extending a class
Use extends to create a subclass, and super to refer to the superclass:
*/
class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }

  // ···
  _illuminateDisplay() {
    print('_illuminateDisplay');
  }

  _activateIrSensor() {
    print('_activateIrSensor');
  }
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }

  // ···
  _bootNetworkInterface() {
    print('_bootNetworkInterface');
  }

  _initializeMemory() {
    print('_initializeMemory');
  }

  _upgradeApps() {
    print('_upgradeApps');
  }
}

main2() {
  SmartTelevision tv = SmartTelevision();
  tv.turnOn();
}

/*
Overriding members
Subclasses can override instance methods, getters, and setters. You can use the @override annotation to indicate that you are intentionally overriding a member:
*/
class SuperSmartTelevision extends Television {
  @override
  void turnOn() {/*...*/}
  // ···
}
/*
To narrow the type of a method parameter or instance variable in code that is type safe, you can use the covariant keyword.
*/

/*
Here’s an example of a class that overrides the + and - operators:
*/
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // Operator == and hashCode not shown. For details, see note below.
  // ···
}

void main3() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}
/*
If you override ==, you should also override Object’s hashCode getter. For an example of overriding == and hashCode, see Implementing map keys.

For more information on overriding, in general, see Extending a class.

noSuchMethod()
To detect or react whenever code attempts to use a non-existent method or instance variable, you can override noSuchMethod():

class A {
  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}

*/

/*
Extension methods
Extension methods, introduced in Dart 2.7, are a way to add functionality to existing libraries. You might use extension methods without even knowing it. For example, when you use code completion in an IDE, it suggests extension methods alongside regular methods.

Here’s an example of using an extension method on String named parseInt() that’s defined in string_apis.dart:

import 'string_apis.dart';
...
print('42'.padLeft(5)); // Use a String method.
print('42'.parseInt()); // Use an extension method.
For details of using and implementing extension methods, see the extension methods page.
*/

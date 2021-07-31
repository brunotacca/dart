void main() {
  print('https://dart.dev/guides/language/language-tour');
  main2();
}

/*
Adding features to a class: mixins
Mixins are a way of reusing a class’s code in multiple class hierarchies.

To use a mixin, use the with keyword followed by one or more mixin names. The following example shows two classes that use mixins:
*/
class Musician extends Performer with Musical {
  // ···
}

class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    super.name = maestroName;
    canConduct = true;
  }
}

/*
To implement a mixin, create a class that extends Object and declares no constructors. Unless you want your mixin to be usable as a regular class, use the mixin keyword instead of class. For example:
*/
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }

  feel() {
    print('Listening happiness');
  }
}
/*
To specify that only certain types can use the mixin — for example, so your mixin can invoke a method that it doesn’t define — use on to specify the required superclass:
*/
mixin MusicalPerformer on Musician {
  // ···
}
/*
Version note: Support for the mixin keyword was introduced in Dart 2.1. Code in earlier releases usually used abstract class instead. For more information on 2.1 mixin changes, see the Dart SDK changelog and 2.1 mixin specification.
*/

mixin Aggressive {
  rage() {
    print('ROOOOOOOOARRR!!');
  }

  feel() {
    print('Anger!!!');
  }
}
mixin Demented {
  process() {
    print('Dooh!');
  }

  feel() {
    print('Duuh, nothing...');
  }
}

class Person {
  String? name;
}

class Performer {}

main2() {
  Maestro m = Maestro('Bach');
  m.entertainMe();
  m.rage();
  m.process();

  // Prints feel() from last mixin.
  m.feel(); // class Maestro extends Person with Musical, Aggressive, Demented

  // Trying to cast?
  (m as Aggressive).feel(); // Unnecessary cast
  // Still prints feel() from last mixin.
  /*
Dart: How to work around the diamond pattern with mixins?
In short: No.
You can't solve a diamond problem in Dart because Dart doesn't have multiple inheritance, so it doesn't have the problem (or feature).
Adding mixins on top of a class is completely normal single inheritance, and Dart class implementation is always a single chain down to Object. The only thing mixins do is to allow the same members to occur in more than one chain.
That also means that there is no way to access overridden members higher in the chain. You can only ever access the top-most declaration, or, as a member function, the top-most declaration of your super-chain (using super.foo()).
  */
}

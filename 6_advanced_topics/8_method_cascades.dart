// https://fluttermaster.com/method-chaining-using-cascade-in-dart/

class ChainCalculator {
  double _accumulator = 0.0;

  ChainCalculator(double initVal) {
    this._accumulator = initVal;
  }

  ChainCalculator add(double val) {
    this._accumulator += val;
    return this;
  }

  ChainCalculator subtract(double val) {
    this._accumulator -= val;
    return this;
  }

  double result() {
    return this._accumulator;
  }
}

main() {
  /*
  By returning this, we can receive the instance back immediately 
  to call another method in chain.  
  */
  ChainCalculator chainCalculator = ChainCalculator(0.0)
                                      .add(2.0)
                                      .subtract(1.0)
                                      .add(2.0)
                                      .subtract(2.0);
  print("Result: " + chainCalculator.result().toString());

  main2();
}

class Calculator {
  double _accumulator = 0;

  Calculator(double startValue) {
    this._accumulator = startValue;
  }

  double add(double val) {
    this._accumulator += val;
    return this._accumulator;
  }

  double subtract(double val) {
    this._accumulator -= val;
    return this._accumulator;
  }

  double result() {
    return this._accumulator;
  }
}

main2() {
  /*
It works perfectly and similar to previous code, but instead of . notation, cascade uses .. (double-dot) notation in order to access current modifying instance.

By using cascade, we don’t have to put many of repeated return this inside the class.

Also, another nice thing about cascade is that, since return this is unnecessary anymore, we can return something else appropriate to the methods.

Let say we want to get accumulated value immediately after calling add or subtract methods.
  */
  Calculator calculator = Calculator(0.0)
                            ..add(12.0)
                            ..subtract(10.0)
                            ..add(5.0)..subtract(8.0);

  print("Result: " + calculator.result().toString());
}

/* Why cascade in Dart?
Just looking at following example, it is taken from official Dart language tour.

final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = (PhoneNumberBuilder()
            ..number = '415-555-0100'
            ..label = 'home')
          .build())
    .build();

Generally speaking, cascade is super-helpful for:
    - building complex objects (lots of property configuration)
    - making objects better for encapsulation. return this makes objects too open.
    - building objects faster with nested cascade.
    - less lines of code.

*/
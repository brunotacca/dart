int verifyTheValue(int val) {
  if (val <= 0) {
    throw Exception('Value must be greater than zero');
  } else if (val == 5) {
    throw MustNotEqual5('NOT 5!!');
  } else if (val >= 10) {
    throw MustLowerThanTen('Value must be lower than ten');
  }
  return val;
}

class MustLowerThanTen implements Exception {
  final String msg;
  const MustLowerThanTen(this.msg);
  String toString() => 'Exception: $msg';
}

class MustNotEqual5 implements Exception {
  final String msg;
  const MustNotEqual5(this.msg);
  String toString() => 'Exception: $msg';
}

void letVerifyTheValue(var val) {
  var valueVerification;

  try {
    valueVerification =
        verifyTheValue(val); // This functions throws the Exceptions to catch
  } on MustNotEqual5 catch (err) {
    // Custom stuff to handle MustNotEqual5
    print(err);
  } catch (e) {
    print(e);
  } finally {
    if (valueVerification == null) {
      print('Value is not accepted');
    } else {
      print('Value verified: $valueVerification');
    }
  }
}

main() {
  letVerifyTheValue(8);
  print('---');
  letVerifyTheValue(20);
  print('---');
  letVerifyTheValue(0);
  print('---');
  letVerifyTheValue(5);
}

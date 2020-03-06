// IntegerDivisionByZeroException
// FormatException
// DeferredLoadException
// IOException
// TimeoutException

main() {
  int x = 12;
  int y = 2;

  try {
    if (x <= 12) {
      throw new Exception('x is <= 12');
      // throw new FormatException('x is <= 12');
    }
    var result = x ~/ y;

    print(result);
  } on IntegerDivisionByZeroException {
    print('Você não pode dividir números por zero');
  } on FormatException catch(e) {
    print(e);
  } catch(e) {
    print(e);
  } finally {
    print('done');
  }
}
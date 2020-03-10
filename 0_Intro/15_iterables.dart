String scream(int length) => "A${'a' * length}h!";

main() {
  final values = [1, 2, 3, 5, 10, 50];
  for (var length in values) {
    print(scream(length));
  }
  print('----');
  values.map(scream).forEach(print);
  print('----');
  values.skip(1).take(3).map(scream).forEach(print);
  /*
    skip(1)skips the first value, 1, in the values list literal.
    take(3)gets the next 3 values—2, 3, and 5—in the values list literal.
    The remaining values are skipped.
  */
}

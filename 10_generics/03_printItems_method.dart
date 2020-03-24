void main() {

  PrintItems<double> d = PrintItems(6, 10.2);
  d.printItem();

  PrintItems<int> i = PrintItems(10, 6);
  i.printItem();

  print(genericParams<int, String>(10, "Hello"));
  print(genericParams(11, "Hi"));
  print(genericParams("11's", 1.1));

  print(genericReturn("11's", 1.1));
  print(genericReturn(11, "11.1"));

  print(genericNumReturn(11, 2.1));
}

class PrintItems<T extends num> {
  int times;
  T printedItem;

  PrintItems(this.times, this.printedItem);

  void printItem() {
    for(int i=0; i<times; i++) {
      print(printedItem);
    }
  }
}

String genericParams<T, S>(T a, S b) {
  return "$a and $b";
}

T genericReturn<T, S>(T a, S b) {
  //return a + b; // error
  return a;
}

S genericNumReturn<T extends num, S extends num>(T a, S b) {
  return a + b;
}

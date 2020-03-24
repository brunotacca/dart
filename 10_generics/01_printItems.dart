void main() {

  PrintItems<String> string = PrintItems(5, "Hi");
  string.printItem();

  PrintItems<double> d = PrintItems(6, 10.2);
  d.printItem();

  PrintItems<PrintItems> rec = PrintItems (3, string);
  rec.printItem();

}

class PrintItems<T> {
  int times;
  T printedItem;

  PrintItems(this.times, this.printedItem);

  void printItem() {
    for(int i=0; i<times; i++) {
      print(printedItem);
    }
  }
}
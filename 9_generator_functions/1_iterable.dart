//https://www.youtube.com/watch?v=TF-TBsgIErY

class MyStrings extends Iterable<String> {
  final List<String> strings;

  MyStrings(this.strings);

  Iterator<String> get iterator => strings.iterator;
}

void main() {
  final myStrings = MyStrings([
    'One',
    'Two',
    'Three',
  ]);

  for(final str in myStrings) print(str);
  
  final lenghts = myStrings.map((s) => s.length);
  for(final lenght in lenghts) print(lenght);
  
}
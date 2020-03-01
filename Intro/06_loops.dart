void main() {
  List sampleList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Tacca', 70.0, true];

  for (int i = 0; i < sampleList.length; i++) {
    print(sampleList[i]);
  }

  for (var item in sampleList) {
    print(item);
  }

  int age = 1;
  while (age < 18) {
    print(age.toString() + ' is under 18.');
    age++;
  }

  do {
    print('did-while');
  } while (false);

  List<String> list = new List<String>();
  list.add('one');
  list.add('two');
  list.add('twelve');
  list.forEach((element) => print(element));

  Set<String> set = Set.from(list);
  set.forEach((element) => print(element));
}

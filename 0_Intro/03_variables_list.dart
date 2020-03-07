void main() {
  List sampleList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Tacca', 70.0, true];

  print("List.length: " + sampleList.length.toString());

  List user = ['Tacca', 33, 75.5, true];

  print("List: " + user.toString());

  Map user2 = {
    'name': 'Tacca',
    'age': 33,
    'weight': 75.5,
    'isAdm': true,
    18: 'eighteen'
  };

  print("Map: " + user2.toString());

  print("List[10]: " + sampleList[10]);

  print("Map['weight']: " + user2['weight'].toString());

  print("Map[18]: " + user2[18].toString());

  Set set = Set.from(sampleList);
  set.forEach((element) => print(element));
  print('Set: ' + set.toString());
}

import 'dart:isolate';

void main() async {
  int n = 10;
  for (int i = 0; i < n; i++) {
    // await isolate.
  }

  Isolate.spawn(sayhii, 'Hello!!');
  Isolate.spawn(sayhii, 'Whats up!!');
  Isolate.spawn(sayhii, 'Welcome!!');

  print('execution from main1');
  print('execution from main2');
  print('execution from main3');
}

void sayhii(var msg) {
  print('execution from sayhii ... the message is :${msg}');
}

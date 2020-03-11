// https://www.youtube.com/watch?v=nQBpOIHE4eE

import 'dart:io';
import 'NumberCreator2.dart';

main() async {
  final myStream = NumberCreator2(15).stream.asBroadcastStream();

  final subscription = myStream.listen(
    (data) {
      print('Data: $data');
    },
    onError: (err) {
      print('Error!');
    },
    cancelOnError: false,
    onDone: () {
      print('Done!');
      exit(0);
    },
  );
}
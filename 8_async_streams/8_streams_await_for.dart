// https://www.youtube.com/watch?v=nQBpOIHE4eE

import 'NumberCreator2.dart';
import 'dart:io';
const max = 10;

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
    },
  );

  var total = await getTotal(myStream);
  print('Total: $total');
  exit(0);
}

Future<int> getTotal(Stream<int> numbers) async {
  int total = 0;

  try {
    // The loop will break if an error is thrown.
    await for (final value in numbers) {
      total += value;
    }
  } catch (e) {
    print('Caught in loop: $e');
  };

  return total;
}
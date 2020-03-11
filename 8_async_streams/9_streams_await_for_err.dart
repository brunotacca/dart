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
    // This loop will not break due to Stream.handleError.
    await for (final value in numbers.handleError((e)=>print(e))) {
      total += value;
    }
  } catch (e) {
    // This won't be called
    // Only if an unhandled error occurs.
    print('Caught in loop: $e');
  };

  return total;
}
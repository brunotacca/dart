// Copyright (c) 2015, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

// https://dart.dev/tutorials/language/streams
import 'dart:async';

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

main() async {
  /*
This code simply receives each event of a stream of integer events, adds them up, and returns (a future of) the sum. When the loop body ends, the function is paused until the next event arrives or the stream is done.
The function is marked with the async keyword, which is required when using the await for loop.
The following example tests the previous code by generating a simple stream of integers using an async* function:
  */
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // 55
}

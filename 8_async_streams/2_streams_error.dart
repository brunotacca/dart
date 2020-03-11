// Copyright (c) 2015, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (var value in stream) {
      sum += value;
    } 
  } catch (e) {
    print(e);
    return -1;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw new Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}

/*
Streams are done when there are no more events in them, and the code receiving the events is notified of this just as it is notified that a new event arrives. When reading events using an await for loop, the loops stops when the stream is done.

In some cases, an error happens before the stream is done; perhaps the network failed while fetching a file from a remote server, or perhaps the code creating the events has a bug, but someone needs to know about it.

Streams can also deliver error events like it delivers data events. Most streams will stop after the first error, but it is possible to have streams that deliver more than one error, and streams that deliver more data after an error event. In this document we only discuss streams that deliver at most one error.

When reading a stream using await for, the error is thrown by the loop statement. This ends the loop, as well. You can catch the error using try-catch. The following example throws an error when the loop iterator equals 4:
*/
main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // -1
}


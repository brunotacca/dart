// https://www.youtube.com/watch?v=nQBpOIHE4eE

import 'dart:io';
import 'NumberCreator2.dart';

const max = 25;

main() async {
  final myStream = NumberCreator2(max).stream.asBroadcastStream();

  final subscription = myStream.listen(
    (data) {
      print('SUB1: $data');
    },
    onError: (err) {
      print('SUB1: Error!');
    },
    cancelOnError: false,
    onDone: () {
      print('SUB1: Done!');
      exit(0);
    },
  );

  var subscription2 = myStream.listen(
    (data) {
      //print('SUB2: $data');
      subscription2Method(data);
    },
    cancelOnError: false,
    onError: (err) {},
    onDone: () {},
  );

  final subscriptionAdmin = myStream.listen(
    (data) {
      if (data == 3) {
        print('SUBADM: Pausing SUB2');
        subscription2.pause();
        /*
          While paused, the subscription will not fire any events. 
          If it receives events from its source, they will be buffered 
          until the subscription is resumed. For non-broadcast streams, 
          the underlying source is usually informed about the pause, 
          so it can stop generating events until the subscription is resumed.

          To avoid buffering events on a broadcast stream, it is better to cancel 
          this subscription, and start to listen again when events are needed, 
          if the intermediate events are not important.
        */
      }
      if (data == 6) {
        print('SUBADM: Pausing SUB1');
        subscription.pause();

        // This will print the buffered values of SUB2 while it was paused.
        print('SUBADM: Resuming SUB2 - Will print buffered data');
        subscription2.resume();
      }
      if (data == 8) {
        // This will print the buffered values of SUB1 while it was paused.
        print('SUBADM: Resuming SUB - Will print buffered data');
        subscription.resume();
      }
      if (data == 15) {
        print('SUBADM: Canceling SUB2 - Will not buffer values.');
        subscription2.cancel();
      }
      if (data == 20) {
        print('SUBADM: Recreating SUB2');
        subscription2 = myStream.listen((data) => subscription2Method(data));
      }
    },
    cancelOnError: false,
    onError: (err) {},
    onDone: () {},
  );
}

subscription2Method(i) => print('SUB2: $i');

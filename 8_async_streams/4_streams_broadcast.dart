// https://www.youtube.com/watch?v=nQBpOIHE4eE
// https://gist.github.com/kwalrath?page=1

import 'dart:io';
import 'NumberCreator.dart';

main() async {
  final myStream = NumberCreator(10)
                    .stream
                    .asBroadcastStream();

  final subscription = myStream.listen(
    (data) { 
      print('Data: $data');
      if(data>=10) exit(0);
    }
  );

  final subscription2 = myStream.listen(
    (data) => print('Data again: $data'),
  );

}

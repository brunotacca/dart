// https://www.youtube.com/watch?v=nQBpOIHE4eE

import 'NumberCreator.dart';
const max = 10;

main() async {
  final myStream = NumberCreator(max)
                    .stream
                    .map((i) => 'String $i')
                    .listen(print);
  
  final myStream2 = NumberCreator(max)
                    .stream
                    .where((i) => i%2 ==0)
                    .map((i) => '^ This is even!')
                    .listen(print);
}


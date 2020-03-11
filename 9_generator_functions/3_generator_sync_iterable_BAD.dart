//https://www.youtube.com/watch?v=TF-TBsgIErY

import 'dart:io';

main() {
  
  final numbers = getRange(1, 10);

  numbers.forEach(print);
}

Iterable<int> getRange(int start, int finish) sync* {

  if(start <= finish) {
    stdout.write('.'); // to check the number of calls here
    yield start;
    for(final val in getRange(start+1, finish)) {
      stdout.write('*'); // to check the number of calls here
      yield val;
    }
  }

  // YIELD
  // Kinda like return, but it doesn't end the function.
  //  Instead, it provides a single value, 
  //  and waits for the caller to request the next one.

}
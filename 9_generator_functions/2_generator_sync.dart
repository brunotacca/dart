//https://www.youtube.com/watch?v=TF-TBsgIErY

import 'dart:async';

main() {
  
  final numbers = getRange(1, 10)
                    .where((num) => num%2==0);

  for(int val in numbers) print(val);

  numbers.forEach(print);
}

// sync* -> Telling dart that the function gonna produce multiple values, on demand.
Iterable<int> getRange(int start, int finish) sync* {

  for(int i = start; i <= finish; i++) {
    yield i; // YIELD (literally), the value.
    // Kinda like return, but it doesn't end the function.
    //  Instead, it provides a single value, 
    //  and waits for the caller to request the next one.
  }

}
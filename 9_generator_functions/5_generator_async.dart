//https://www.youtube.com/watch?v=TF-TBsgIErY

Future<int> fetchDouble(int val) {
  // fetch val*2 from the server
  return Future.delayed(Duration(milliseconds: 500),(){return val*2;});
}

Stream<int> fetchDoubles(int start, int finish) async* {
  if(start<=finish) {
    yield await fetchDouble(start);
    yield* fetchDoubles(start+1, finish);
  }
}

void main() {
  fetchDoubles(1,10).listen(print);
}
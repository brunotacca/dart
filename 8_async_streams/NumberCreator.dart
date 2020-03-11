import 'dart:async';

class NumberCreator {
  NumberCreator(max) {
    Timer.periodic(Duration(seconds: 1), (t) {
      if (!_controller.isClosed) {
        _controller.sink.add(_count);
        _count++;
      }
      if (_count == max) _controller.close();
    });
  }

  var _count = 1;
  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;
}
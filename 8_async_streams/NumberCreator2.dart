import 'dart:async';

class NumberCreator2 {
  NumberCreator2(max) {
    Timer.periodic(Duration(seconds: 1), (t) {
      if (_count == max) _controller.close();
      if (!_controller.isClosed) {
        var operation = '';
        if (_count == 11 || _count == 19) {
          _controller.addError(null);
          operation = 'ERROR';
        } else {
          _controller.sink.add(_count);
          operation = 'SINK';
        }
        print('______________________________________ $operation $_count');

        _count++;
      }
    });
  }
  var _count = 1;
  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;
}
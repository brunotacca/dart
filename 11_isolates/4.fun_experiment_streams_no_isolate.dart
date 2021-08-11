import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';

Queue<int> queue = Queue<int>();
var rng = new Random();
void main() async {
  final n = 100;
  final myStream = NumberCreator(n).stream;

  final subscription = myStream.listen((data) {
    queue.add(data);
    // if (data > n - 1) exit(0);
  }).onDone(() {
    print("STREAM NumberCreator DONE");
    Future.delayed(Duration(seconds: 10), () {
      exit(0);
    });
  });

  MethodA a = MethodA();
  MethodB b = MethodB();

  final myMethodStream = ComputeWithMethodStream(b, queue).stream;
  StreamSubscription<String> methodStreamSubscription;

  methodStreamSubscription = myMethodStream.listen(null);
  methodStreamSubscription.onData((data) {
    print("RESULT: " + data);
  });
  methodStreamSubscription.onDone(() {
    print("STREAM ComputeWithMethodStream DONE");
  });
  methodStreamSubscription.onError((e) {
    print("STREAM ComputeWithMethodStream DONE $e");
  });

  Future.delayed(Duration(seconds: 3), () {
    print("PAUSING");
    methodStreamSubscription.pause();
  });

  Future.delayed(Duration(seconds: 6), () {
    print("RESUMING");
    methodStreamSubscription.resume();
  });

  Future.delayed(Duration(seconds: 8), () {
    print("CANCELLING");
    methodStreamSubscription.cancel();
  });
}

class NumberCreator {
  NumberCreator(max) {
    Timer.periodic(Duration(milliseconds: 50), (t) {
      if (!_controller.isClosed) {
        _controller.sink.add(_count);
        _count++;
      }
      if (_count > max) _controller.close();
    });
  }

  var _count = 1;
  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;
}

class ComputeWithMethodStream {
  bool _awaitingComputation = false;
  late StreamController<String> _controller;
  Stream<String> get stream => _controller.stream;
  late Method _method;
  late Queue<int> _queue;
  late Timer? _timer;

  ComputeWithMethodStream(Method method, Queue<int> dataQueue) {
    print("CONSTRUCTOR");
    _method = method;
    _queue = dataQueue;

    _controller = StreamController<String>(
        onListen: _onListen,
        onPause: _onPause,
        onResume: _onResume,
        onCancel: _onCancel);
  }

  void tick(_) async {
    print("TICK");
    if (_queue.isNotEmpty && !_awaitingComputation) {
      int data = _queue.removeFirst();
      _awaitingComputation = true;
      String result = await _method.call(data.toString());
      _awaitingComputation = false;
      if (!_controller.isClosed) {
        _controller.add(result);
      }
    }
  }

  void _onListen() {
    _startTimer();
  }

  void _onPause() {
    _stopTimer();
  }

  void _onResume() {
    _startTimer();
  }

  void _onCancel() {
    _stopTimer();
    _controller.close();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 10), tick);
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}

abstract class Method {
  Future<String> call(String msg);
}

class MethodA implements Method {
  @override
  Future<String> call(String msg) async {
    await Future.delayed(Duration(milliseconds: 100));
    return msg + "A";
  }
}

class MethodB implements Method {
  @override
  Future<String> call(String msg) async {
    await Future.delayed(Duration(milliseconds: rng.nextInt(500)));
    return msg + "B";
  }
}

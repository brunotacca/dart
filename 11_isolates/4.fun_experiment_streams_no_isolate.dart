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

  final myMethodStream = ComputeWithMethodStream(a, queue).stream;
  final methodStreamSubscription = myMethodStream.listen((event) {
    print("RESULT: " + event);
  }).onDone(() {
    print("STREAM ComputeWithMethodStream DONE");
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
  ComputeWithMethodStream(Method method, Queue<int> dataQueue) {
    Timer.periodic(Duration(milliseconds: 1), (t) async {
      if (dataQueue.isNotEmpty) {
        int data = dataQueue.removeFirst();
        String result = await method.call(data.toString());
        if (!_controller.isClosed) {
          _controller.sink.add(result);
        }
      }
    });
  }

  final _controller = StreamController<String>();
  Stream<String> get stream => _controller.stream;
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
    await Future.delayed(Duration(milliseconds: 120));
    return msg + "B";
  }
}

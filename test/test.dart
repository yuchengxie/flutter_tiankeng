import 'dart:async';

main() {
  // StreamController controller = StreamController();
  // StreamSubscription subscription=controller.stream.listen((data)=>print('$data'));
  // controller.sink.add(123);
  // controller.sink.add('xyc');
  // controller.sink.add(3.00);
  StreamController ctrl=StreamController();
  StreamSubscription subscription=ctrl.stream.listen((data)=>print('$data'));
  ctrl.sink.add(123);
  ctrl.sink.add('222');
}

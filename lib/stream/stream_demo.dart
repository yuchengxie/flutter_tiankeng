import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamDemo.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('create a stream');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController<String>.broadcast();
    _sinkDemo = _streamDemo.sink;
    print('start listen stream');
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    print('initialize completed');
  }

  void onDataTwo(String data) {
    print('onDataTwo: $data');
  }

  void onData(String data) {
    print('onDataOne: $data');
  }

  void onError(error) {
    print(error);
  }

  void onDone() {
    print('onDone');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    return 'hello ~';
  }

  _addDataToStream() async {
    print('add');
    String data = await fetchData();
    // if(_sinkDemo==null) return
    _sinkDemo.add(data);
    print('add: $data');
  }

  _pauseStream() {
    print('pause');
    _streamSubscription.pause();
  }

  _resumeStream() {
    print('resume');
    _streamSubscription.resume();
  }

  _cancelStream() {
    print('cancel');
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                stream: _streamDemo.stream,
                initialData: '...',
                builder: (context,snapshot){
                  return Text('${snapshot.data}');
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('add'),
                onPressed: _addDataToStream,
              ),
              FlatButton(
                child: Text('pause'),
                onPressed: _pauseStream,
              ),
              FlatButton(
                child: Text('resume'),
                onPressed: _resumeStream,
              ),
              FlatButton(
                child: Text('cancel'),
                onPressed: _cancelStream,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Observable<String> _observable=Observable(Stream.fromIterable(['你好','hello']));
    // Observable<String> _observable=Observable.fromFuture(Future.value('xyc'));
    // Observable<String> _observable=Observable.periodic(Duration(seconds: 3),(x)=>x.toString());
    // _observable.listen(print);
    // PublishSubject<String> _subject = PublishSubject<String>();
    // _subject.listen((data) => print('listen 1:$data'));
    // _subject.listen((data) => print('listen 2:${data.toUpperCase()}'));
    // _subject.add('hello ~ aaaaaaaaaaaaaaaaaaaaaaaaaa');
    _textFieldSubject = PublishSubject();
    _textFieldSubject
        // .map((item)=>'item: $item')
        // .where((item) => item.length > 9)
        .debounceTime(Duration(seconds: 1))
        .listen((data) => print('监听啊到: $data'));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: Text('txdartdemo'),),
    //   body: Center(),
    // );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Title'),
    //   ),
    //   body: Container(),
    // );
    return Container(
      margin: EdgeInsets.all(10),
      child: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.orange),
          child: TextField(
            decoration: InputDecoration(labelText: '地址', filled: true),
            onChanged: (value) {
              _textFieldSubject.add('input:$value');
            },
            onSubmitted: (value) {
              _textFieldSubject.add('submit:$value');
            },
          )),
    );
  }
}

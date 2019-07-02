import 'dart:math';

import 'package:flutter/material.dart';

class Producet extends StatefulWidget {
  Producet({Key key}) : super(key: key);

  _ProducetState createState() => _ProducetState();
}

class _ProducetState extends State<Producet>
    with AutomaticKeepAliveClientMixin {
  int _num;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._num = 10;
    // doAsyncStuff();
  }

  @override
  void updateKeepAlive() {
    // TODO: implement updateKeepAlive
    super.updateKeepAlive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(this._num.toString()),
            RaisedButton(
              child: Text('获取100内的随机数'),
              onPressed: () {
                setState(() {
                  Random rdm = Random();
                  this._num = rdm.nextInt(100);
                });
                updateKeepAlive();
              },
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => false;
  bool keepAlive = false;

  // @override
  // void initState() {
  //   doAsyncStuff();
  // }

  Future doAsyncStuff() async {
    keepAlive = true;
    updateKeepAlive();
    // Keeping alive...

    // await Future.delayed(Duration(seconds: 10));
    setState(() {
      _num=20;
    });

    // keepAlive = false;
    keepAlive = true;
    updateKeepAlive();
    // Can be disposed whenever now.
  }

  @override
  bool get wantKeepAlive => keepAlive;
}

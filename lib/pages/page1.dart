import 'package:flutter/material.dart';
import './bloc/bloc_counter.dart';

class PageOne extends StatefulWidget {
  PageOne({Key key}) : super(key: key);

  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int _count = 100;
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(this._count.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('点击增加'),
                    onPressed: () {
                      setState(() {
                        this._count++;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('跳转下一个界面'),
                    onPressed: () {
                      // Navigator.popAndPushNamed(context, '/p');
                      // Navigator.pushNamed(context, '/p');
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('跳转状态界面'),
                    onPressed: () {
                      // Navigator.popAndPushNamed(context, '/p');
                      Navigator.pushNamed(context, '/s');
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('stream'),
                    onPressed: () {
                      // Navigator.popAndPushNamed(context, '/p');
                      Navigator.pushNamed(context, '/stream');
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('rxdemo'),
                    onPressed: () {
                      // Navigator.popAndPushNamed(context, '/p');
                      Navigator.pushNamed(context, '/rxdart');
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('blocdemo'),
                    onPressed: () {
                      // Navigator.popAndPushNamed(context, '/p');
                      Navigator.pushNamed(context, '/bloc', arguments: _count);
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('shared_preferences'),
                    onPressed: () {
                      // Navigator.popAndPushNamed(context, '/p');
                      Navigator.pushNamed(context, '/db');
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:app_tiankeng/pages/page1.dart';
import 'package:app_tiankeng/pages/page2.dart';
import 'package:flutter/material.dart';
import './bloc/bloc_counter.dart';

import 'page3.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List<Widget> _list = [PageOne(), PageTwo(), PageThree()];
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Container(
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        child: UserAccountsDrawerHeader(
                      accountName: Text('bbb'),
                      accountEmail: Text('aaa'),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.itying.com/images/flutter/1.png'),
                      ),
                    )),
                  ],
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.home),
                  ),
                  title: Text('我的空间'),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.assessment),
                  ),
                  title: Text('我的资产'),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.settings),
                  ),
                  title: Text('我的设置'),
                ),
                Divider(),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('哈哈哈'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  title: Text('aaa'),
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.hot_tub)),
              BottomNavigationBarItem(
                title: Text('bbb'),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text('ccc'),
                icon: Icon(Icons.home),
              ),
            ],
            currentIndex: this._currentIndex,
            onTap: (index) {
              setState(() {
                this._currentIndex = index;
              });
            },
          ),
          // body: _list[this._currentIndex],
          body: IndexedStack(
            children: _list,
            index: this._currentIndex,
          ),
        ),
      ),
    );
  }
}

// class Tabs extends StatelessWidget {
//   int _currentIndex = 2;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(title: Text('111'), icon: Icon(Icons.home)),
//             BottomNavigationBarItem(title: Text('222'), icon: Icon(Icons.home)),
//             BottomNavigationBarItem(title: Text('333'), icon: Icon(Icons.home)),
//             BottomNavigationBarItem(title: Text('444'), icon: Icon(Icons.home)),
//             BottomNavigationBarItem(title: Text('555'), icon: Icon(Icons.home)),
//           ],
//           type: BottomNavigationBarType.fixed,
//           currentIndex: this._currentIndex,
//           onTap: (index) {
//           },
//         ),
//         appBar: AppBar(
//           title: Text('hh'),
//         ),
//         body: Column(
//           children: <Widget>[
//             RaisedButton(
//               child: Text('page1'),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/a');
//               },
//             ),
//             RaisedButton(
//               child: Text('page2'),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/b');
//               },
//             ),
//           ],
//         ));
//   }
// }

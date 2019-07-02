import 'package:app_tiankeng/httpdemo/http_demo.dart';
import 'package:app_tiankeng/pages/bloc/bloc_demo.dart';
import 'package:app_tiankeng/pages/db/db_demo.dart';
import 'package:app_tiankeng/pages/page1.dart';
import 'package:app_tiankeng/pages/page2.dart';
import 'package:app_tiankeng/pages/product.dart';
import 'package:app_tiankeng/pages/rxdart/rxdart_demo.dart';
import 'package:app_tiankeng/pages/tabs.dart';
import 'package:app_tiankeng/state/state_management.dart';
import 'package:app_tiankeng/stream/stream_demo.dart';
import 'package:flutter/material.dart';

main() {
  // runApp(MyApp());
  runApp(MaterialApp(
    // home: Tabs(), // becomes the route named '/'
    initialRoute: '/httpdemo',
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => Tabs(),
      '/a': (BuildContext context) => PageOne(),
      '/b': (BuildContext context) => PageTwo(),
      '/p': (context) => Producet(),
      '/s': (context) => StateManagement(),
      '/stream': (context) => StreamDemo(),
      '/rxdart': (context) => RxDartDemo(),
      '/bloc': (context) => BlocDemo(),
      '/db':(context)=>DbDemo(),
      '/httpdemo':(context)=>HttpDemo(),
    },
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      splashColor: Colors.white70
      // appBarTheme: AppBarTheme(
        
      // ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   // title:'测试天坑',

    // );
    return MaterialApp(
      home: Tabs(),
    );
  }
}

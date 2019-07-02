import 'package:app_tiankeng/pages/bloc/bloc_counter.dart';
import 'package:flutter/material.dart';

class BlocDemo extends StatelessWidget {
  const BlocDemo({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    var pass_count=ModalRoute.of(context).settings.arguments;
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
          elevation: 0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}

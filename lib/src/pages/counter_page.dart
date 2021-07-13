
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_weather_app/src/mobx/counter_store/counter.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  
  final  _counter = Counter();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${_counter.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

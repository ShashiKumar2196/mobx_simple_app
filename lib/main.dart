import 'package:flutter/material.dart';
import 'package:mobx_weather_app/src/mobx/cats_store/cats_store.dart';
import 'package:mobx_weather_app/src/pages/cat_facts-page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_)=>CatsStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CatFactsPage(),
      ),
    );
  }
}


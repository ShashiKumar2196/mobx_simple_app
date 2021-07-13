import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_weather_app/src/mobx/cats_store/cats_store.dart';
import 'package:mobx_weather_app/src/models/cat_fact.dart';
import 'package:provider/provider.dart';

class CatFactPage extends StatelessWidget {


  final CatFact catFact;

  const CatFactPage({Key? key, required this.catFact}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _catsStore = Provider.of<CatsStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(catFact.type.toString()),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Row(
            children: [
              Text('Total amount of posts read; '),
              Text('${_catsStore.factsRead}'),
            ],
          ),
          Row(
            children: [
              Text('Total amount of posts; '),
              Text('${_catsStore.facts}'),
            ],
          ),
          SizedBox(height: 42,),
          Text(catFact.text.toString()),

        ],
      ),
    );
  }
}

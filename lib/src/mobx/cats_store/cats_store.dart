import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_weather_app/src/models/cat_fact.dart';
import 'package:http/http.dart' as http;
import 'package:mobx_weather_app/src/pages/cat_fact_page.dart';
import 'package:provider/provider.dart';
part 'cats_store.g.dart';


enum loadingState  {none, loading, error}

class CatsStore = _CatsStore with _$CatsStore;

abstract class _CatsStore with Store{

  static  var _catFactsUrl = Uri.parse("https://cat-fact.herokuapp.com/facts");

  _CatsStore(){
    fetchCatsFacts();
  }

  @observable
  List<CatFact> catFacts = [];

  @observable
  loadingState state = loadingState.loading;

  @computed
  int get facts => catFacts.length;

  @observable
  int factsReadCount = 0;

  @computed
  String get factsRead => factsReadCount.toString();

  @action
  void incrementFactsRead(){
    factsReadCount++;
  }

  @action
  Future<void> fetchCatsFacts() async{
    //getting the facts
    state = loadingState.loading;
    final response = await http.get(_catFactsUrl);
    if(response.statusCode == 200){
      List<dynamic>  decodedItems = json.decode(response.body);
      print('yeahhhhh $decodedItems');
      catFacts = List.from(decodedItems).map((json) => CatFact.fromJson(json)).toList();
      //we got the data
      state = loadingState.none;
    }else{
      print('failed getting the data');
      state = loadingState.error;
    }
  }


}


class CatFactsTile extends StatelessWidget {
  final CatFact catFact;

  const CatFactsTile({Key? key, required this.catFact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _catsStore = Provider.of<CatsStore>(context);
    return  ListTile(
      onTap: (){
        _catsStore.incrementFactsRead();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CatFactPage(catFact: catFact,)));
      },
      title: Text(catFact.type.toString()),
      subtitle: Text(catFact.text.toString()),
    );
  }
}


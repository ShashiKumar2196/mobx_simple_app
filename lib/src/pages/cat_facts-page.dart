import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_weather_app/src/mobx/cats_store/cats_store.dart';
import 'package:provider/provider.dart';

class CatFactsPage extends StatelessWidget {

  const CatFactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _catStore = Provider.of<CatsStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat Facts"),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 16),
              alignment: Alignment.center,
              child: Observer(builder: (_)=>
                Text(_catStore.factsRead,
                  style: Theme.of(context).primaryTextTheme.title,
                ),
              )),
        ],
      ),
      body: Observer(
        builder: (context) {
          if(_catStore.state == loadingState.loading)
            return Center(child: CircularProgressIndicator());
          else if(_catStore.state == loadingState.none)
          return ListView.builder(
              itemCount: _catStore.catFacts.length,
              itemBuilder: (cxt,index){
                final catFact = _catStore.catFacts[index];
                return CatFactsTile(catFact: catFact);
              });
          else
            return Center(child: Text('There was an error'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _catStore.fetchCatsFacts
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_applatest/modals/brewmodel.dart';
import 'package:flutter_applatest/screens/brew_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_applatest/modals/brewmodel.dart';
class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews=Provider.of<List<BrewModel>>(context)??[];
    //print(brews);
    //printing the collections of firebase
   
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context,index){
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
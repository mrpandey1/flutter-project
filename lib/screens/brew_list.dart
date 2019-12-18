import 'package:flutter/material.dart';
import 'package:flutter_applatest/modals/brewmodel.dart';
import 'package:color/color.dart';
import 'dart:math';

class BrewTile extends StatelessWidget {
 
    final BrewModel brew;
    BrewTile({this.brew});

  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20,20 ,20,0),
        child: ListTile(
          title: Center(
            child: Text(brew.name,
            style: TextStyle(
              color: Colors.pink[700],
              fontSize: 20,
            ),
            ),
          ),
          isThreeLine: true,
          subtitle:  Column(
                    children: <Widget>[
                       Text('Favourite game ${brew.color}',
            style: TextStyle(color: Colors.pink[700],
            fontSize: 15),
            ),
            Text('Age ${brew.age}',
            style: TextStyle(color: Colors.pink[700],
            fontSize: 15)),

                    ],
            ),
          ),

        ),
    );
  }
}
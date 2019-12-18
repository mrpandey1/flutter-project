import 'package:flutter/material.dart';
import 'package:flutter_applatest/modals/brewmodel.dart';
import 'package:flutter_applatest/screens/brew.dart';
import 'package:flutter_applatest/screens/setting_page.dart';
import 'package:flutter_applatest/service/auth.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_applatest/service/database.dart';
class home extends StatelessWidget {
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
  void showUpdate()
  {
    showModalBottomSheet(isScrollControlled: true,context: context,builder: (context)
    {
      return Settings();
    });
  }
    return StreamProvider<List<BrewModel>>.value(
      value: DatabaseService().details,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(backgroundColor: Colors.brown[400],
          title: Text('Knowledge-page')
          ,actions: <Widget>[
            FlatButton.icon(
              onPressed: ()async{
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
            label: Text('logout'),
            ),
            FlatButton.icon(
              onPressed: (){
                showUpdate();
              },
              icon: Icon(Icons.settings),
            label: Text('Update'),
            )
          ],
          ),
          body: BrewList(),
      ),
    );
  }
}
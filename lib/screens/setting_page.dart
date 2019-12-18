import 'package:flutter/material.dart';
import 'package:flutter_applatest/modals/user.dart';
import 'package:flutter_applatest/modals/user.dart';
import 'package:flutter_applatest/service/auth.dart';
import 'package:flutter_applatest/service/database.dart';
import 'package:flutter_applatest/shared/decoration.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey=GlobalKey<FormState>();
   List<int> ages=[16,17,18,19,20,21];
  String name;
  int agee;
  String color;
  @override
  Widget build(BuildContext context) {
        final  user =Provider.of<User>(context);
        return StreamBuilder<UserData>(
          stream: DatabaseService(uid:user.uid).userData,
          builder: (context, snapshot) {
            if(snapshot.hasData)
              {
                UserData userdata=snapshot.data;
               return Container(
                height: MediaQuery.of(context).size.height-100,
                color: Colors.brown[50],
                child:
                Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20,4),
                    child: Column(children: <Widget>[
                      Text('Update your profile',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.brown[500]
                      ),),
                      SizedBox(height: 10,),
                      TextFormField( 
                        initialValue: userdata.name,
                        decoration: textInputDecoration,
                        validator: (val)=>val.isEmpty?'please enter name':null,
                        onChanged: (val)=>setState(()=>name=val),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: textInputDecoration,
                        initialValue: userdata.color,
                        validator: (val)=>val.isEmpty?'please enter color':null,
                        onChanged: (val)=>setState(()=>color=val),
                      ),
                      SizedBox(height: 15,),
                      DropdownButtonFormField(
                        value: agee??userdata.age,
                        decoration: textInputDecoration,
                        items: ages.map((agee)
                        {
                          return DropdownMenuItem(
                            value: agee,
                            child: Text('$agee years'),
                          );
                        }).toList(), onChanged: (val) {
                          setState(() {
                      
                            agee=val;
                          });
                        }, 

                      ),
                      SizedBox(height: 10,),
                      RaisedButton(onPressed: ()async{
                      if(_formKey.currentState.validate())
                        {
                          await DatabaseService(uid: user.uid).updateUserData(
                            name ?? userdata.name, 
                            color ?? userdata.color, 
                            agee ?? userdata.age);
                        }
                        Navigator.pop(context);
                      },
                      child: Text('Submit',style: TextStyle(color: Colors.white),),
                      color: Colors.pink[400],
                      )
                    ],),
                  ),
                ),
              )
              );
            }
            else{

            }
            
          }
        );
    
  }
}
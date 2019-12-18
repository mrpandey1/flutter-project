import 'package:flutter/material.dart';
import 'package:flutter_applatest/service/auth.dart';
import 'package:flutter_applatest/shared/decoration.dart';
import 'package:flutter_applatest/shared/loading.dart';

class signin extends StatefulWidget {
  final Function toggleView;
  signin({this.toggleView});
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
final _formKey=GlobalKey<FormState>();
final AuthService _auth=AuthService();
String email='';
String password='';
String error=''; 
bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading ?  Loading(): Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(title: Text('Login to Knowledge-page'),
      backgroundColor: Colors.brown[400],
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Register'),
          onPressed: (){
            widget.toggleView();
          },
        )
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              decoration:textInputDecoration.copyWith(hintText: 'Email'),
            validator: (val)=>val.isEmpty?'please enter email':null,
            onChanged: (val)
            {
              setState(() =>email=val);
            },

           ),
          SizedBox(height: 10,),
           TextFormField(
             decoration: textInputDecoration.copyWith(hintText: 'Password'),
           obscureText: true,
            validator: (val)=>val.length<6?'please enter minimum 6 words in password':null,
            onChanged: (val)
            {
              setState(() =>password=val);
            },
          ),
          SizedBox(height: 20,),
          RaisedButton(
            color: Colors.pink[500],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('login',
              style: TextStyle(
                color: Colors.white,
              ),),
            ),
            onPressed: ()async{
            if(_formKey.currentState.validate())
              {
                setState(()=>loading=true);
                dynamic result=await _auth.signInWithEmailPassword(email, password);  
                if(result==null)
                {
                  setState(() {
                    error='invalid credentials';
                    loading=false;
                  });
                }
              //   Timer(Duration(seconds: 3),(){
              //  setState(()=>error='invalid mail');
              //   }); 
              }
            },
            
          ),
          Text(error,
          style: TextStyle(
            color: Colors.red,
          ),
          ),
          
          ],),
        ),        
      ),
    
    );
  }
}













/*sign in anonymously
child: RaisedButton(
          onPressed: () async{
            dynamic result =await _auth.signInAnon();
            if(result==null)
            {
              print("something went wrong");
            }else{
              print('signed in');
              print(result.uid);
            }
          },
          child: Text('login'), 
        )
*/
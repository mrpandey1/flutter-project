import 'package:flutter/material.dart';
import 'package:flutter_applatest/authenticate/register.dart';
import 'package:flutter_applatest/authenticate/signin.dart';
class authenticate extends StatefulWidget {
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  bool isSignpage=true;
  void toggleView()
  {
    setState(() => isSignpage = !isSignpage);
  }
  @override
  Widget build(BuildContext context) {
    if(isSignpage)
    {
      return signin(toggleView:toggleView);
    }else{
      return Register(toggleView:toggleView);
    }

  }
}
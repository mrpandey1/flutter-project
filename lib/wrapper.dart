import 'package:flutter/material.dart';
import 'package:flutter_applatest/authenticate/authenticate.dart';
import 'package:flutter_applatest/screens/home.dart';
import 'package:provider/provider.dart';
import 'modals/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  user =Provider.of<User>(context);
    if(user==null)
    {
    return authenticate();
    } else{
      return home();
    }
  }
}

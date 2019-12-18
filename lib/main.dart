import 'package:flutter/material.dart';
import 'package:flutter_applatest/modals/user.dart';
import 'package:flutter_applatest/service/auth.dart';
import 'package:flutter_applatest/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(value:AuthService().user,
    child: MaterialApp(home: Wrapper(),
    ),
    );
  }
}
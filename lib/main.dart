import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/navigationBar.dart';

const myColor = Color.fromRGBO(20, 20, 20, 100);
const myColorPrimary = Color.fromRGBO(12, 10, 13, 1);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo',
      theme: ThemeData(
          primaryTextTheme:
              TextTheme(bodyText1: TextStyle(color: Colors.white)),
          scaffoldBackgroundColor: myColor,
          primaryColor: myColorPrimary,
          // ignore: deprecated_member_use
          textTheme: TextTheme(title: TextStyle(color: Colors.white70))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: NavigationBar(),
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/today.dart';
import 'package:todo_list/pages/calendar.dart';
import 'package:todo_list/pages/analysis.dart';
import 'package:todo_list/pages/notes.dart';

const myColor = Color.fromRGBO(20, 20, 20, 100);
const myColorPrimary = Color.fromRGBO(12, 10, 13, 1);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo',
      theme: ThemeData(
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

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            Today(),
            Calendar(),
            Analysis(),
            Notes(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(
                Icons.assignment,
                size: 27,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.date_range,
                size: 27,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.assessment,
                size: 27,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.border_color,
                size: 27,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: myColorPrimary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list/pages/today.dart';
import 'package:todo_list/pages/calendar.dart';
import 'package:todo_list/pages/analysis.dart';
import 'package:todo_list/pages/notes.dart';

import '../main.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            Today(),
            CalendarPage(),
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

import 'package:flutter/material.dart';

import '../main.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColorPrimary,
        centerTitle: true,
        title: Text("Заметки"),
        actions: <Widget>[
          new IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.red,
          onPressed: () {}),
    );
  }
}

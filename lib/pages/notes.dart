import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        child: Text("Заметки"),
      ),
    );
  }
}

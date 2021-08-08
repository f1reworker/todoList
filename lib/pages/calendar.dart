import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Календарь"),
        actions: <Widget>[
          new IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        child: Text("Календарь"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Сегодня"),
        actions: <Widget>[
          new IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        child: Text("Today"),
      ),
    );
  }
}

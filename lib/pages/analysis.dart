import 'package:flutter/material.dart';

import '../main.dart';

class Analysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColorPrimary,
        centerTitle: true,
        title: Text("Анализ"),
        actions: <Widget>[
          new IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        child: Text("Анализ"),
      ),
    );
  }
}

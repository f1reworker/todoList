import 'package:flutter/material.dart';
import 'package:todo_list/main.dart';

class NotesEditing extends StatefulWidget {
  NotesEditing({Key? key}) : super(key: key);

  @override
  _NotesEditingState createState() => _NotesEditingState();
}

class _NotesEditingState extends State<NotesEditing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildEditingActions(),
        backgroundColor: myColorPrimary,
      ),
    );
  }

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {},
            icon: Icon(Icons.done),
            label: Text('Save'))
      ];
}

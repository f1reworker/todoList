import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../event.dart';

final List<Event> _events = [];

class EventProvider with ChangeNotifier {
  List<Event> get events => _events;
  void getEventsCalendar(dynamic _data) {
    _events.clear();
    for (int i = 0; i < _data.length; i++) {
      Color _backgroundColor = Colors.green;
      switch (_data[i]["color"]) {
        case "red":
          _backgroundColor = Colors.red;
          break;
        case "orange":
          _backgroundColor = Colors.orange;
          break;
        case "yellow":
          _backgroundColor = Colors.yellow;
          break;
        case "blue":
          _backgroundColor = Colors.blue;
          break;
        case "purple":
          _backgroundColor = Colors.purple;
          break;
      }
      DateTime _deadline = DateTime.parse(_data[i]["deadline"]);
      _events.add(Event(
          title: _data[i]["title"],
          description: _data[i]["description"],
          duration: _data[i]["duration"],
          importance: _data[i]["importance"],
          deadline: _deadline,
          backgroundColor: _backgroundColor));
    }

    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

import '../event.dart';

final List<Event> _events = [];
List<Event> _eventsToday = [];

class EventProvider extends ChangeNotifier {
  DateTime dateOnly(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);
  DateTime _selectedDate = DateTime.now();
  List<Event> get eventsToday => _eventsToday;
  List<Event> get events => _events;
  List<Event> get eventsOfSelectedDate => _events;
  DateTime get selectedDate => _selectedDate;
  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void eventsTodayFunc() {
    _eventsToday = [];
    int _eventsLength = 0;
    _eventsLength = events.length;
    for (int i = 0; i < _eventsLength; i++) {
      if (dateOnly(DateTime.now()) == dateOnly(events[i].from)) {
        _eventsToday.add(events[i]);
        print(events[i].title);
      }
    }
    notifyListeners();
  }

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}

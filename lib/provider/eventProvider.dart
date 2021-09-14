import 'package:flutter/cupertino.dart';

import '../event.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];
  DateTime _selectedDate = DateTime.now();
  List<Event> get events => _events;
  List<Event> get eventsOfSelectedDate => _events;
  DateTime get selectedDate => _selectedDate;
  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}

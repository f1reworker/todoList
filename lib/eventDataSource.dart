import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todo_list/event.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }
  Event getEvent(int index) => appointments![index] as Event;

  @override
  int getDuration(int index) => getEvent(index).duration;

  @override
  DateTime getDeadline(int index) => getEvent(index).deadline;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  Color getColor(int index) => getEvent(index).backgroundColor;

  @override
  // ignore: override_on_non_overriding_member
  String getDescription(int index) => getEvent(index).description;
}

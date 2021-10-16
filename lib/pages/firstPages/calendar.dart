import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todo_list/main.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:todo_list/provider/eventProvider.dart';

import '../../eventDataSource.dart';
import '../eventEditingPage.dart';

DateTime selectedDate = DateTime.now();

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColorPrimary,
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
      body: Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendarTheme(
        data: SfCalendarThemeData(
          brightness: Brightness.dark,
        ),
        child: SafeArea(
          child: CalendarWidget(),
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);

    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(provider.events),
      firstDayOfWeek: 1,
      initialSelectedDate: DateTime.now(),
      onTap: (CalendarTapDetails details) {
        selectedDate = (details.date!);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EventEditingPage()));
      },
    );
  }
}

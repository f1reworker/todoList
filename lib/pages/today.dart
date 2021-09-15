import 'package:flutter/material.dart';
import 'package:todo_list/provider/eventProvider.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  void initState() {
    super.initState();
    EventProvider().eventsTodayFunc();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColorPrimary,
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
        body: eventToday(context));
  }
}

Widget eventToday(
  BuildContext context,
) {
  final provider = Provider.of<EventProvider>(context);
  if (provider.eventsToday.length == 0) {
    return Center(
      child: Text('No Events TOday!'),
    );
  }
  return Container(
    child: new ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      // color: Colors.black,),
      itemCount: provider.eventsToday.length,
      itemBuilder: (context, index) {
        return new Container(
          height: 122,
          child: Text(provider.eventsToday[index].title),
        );
      },
    ),
  );
}

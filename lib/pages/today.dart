import 'package:flutter/material.dart';
import 'package:todo_list/pages/eventEditingPage.dart';
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
  int eventsLength = provider.eventsToday.length;
  if (provider.eventsToday.length == 0) {
    return Center(
      child: Text('No Events TOday!'),
    );
  }
  return Container(
    child: new ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      // color: Colors.black,),
      itemCount: eventsLength,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: new TextButton(
                child: Container(
                  height: 82,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          provider.eventsToday[index].title,
                          style: new TextStyle(
                              fontSize: 20,
                              color: provider.events[index].backgroundColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          provider.eventsToday[index].description,
                          style: new TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EventEditingPage())),
              ),
            ),
            Container(
                width: 50,
                child: TextButton(
                    child: Icon(
                      Icons.check_box_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      provider.deleteEvent(index);
                      provider.eventsTodayFunc();
                    }))
          ],
        );
      },
    ),
  );
}


//TODO: добавление списоков/задач на сегодня 

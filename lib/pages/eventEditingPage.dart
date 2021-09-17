import 'dart:async';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/pages/calendar.dart';
import 'package:todo_list/provider/eventProvider.dart';

import '../event.dart';
import '../utils.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;

  const EventEditingPage({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

bool checkedColor = false;

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      fromDate = selectedDate;
      toDate = selectedDate.add(Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildEditingActions(),
          backgroundColor: myColorPrimary,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle(),
                buildDescription(),
                buildCheckColor(),
                SizedBox(
                  height: 12,
                ),
                buildDateTimePickers(),
              ],
            ),
          ),
        ),
      );

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: saveForm,
            icon: Icon(Icons.done),
            label: Text('Save'))
      ];

  Widget buildTitle() => TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Add Title',
        ),
        //onFieldSubmitted: (_) => saveForm(),
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be Empty' : null,
        controller: titleController,
      );

  Widget buildDescription() => TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Add Description',
        ),
        //onFieldSubmitted: (_) => saveForm(),
        controller: descriptionController,
      );

  Color backgroundColor = Colors.green;
  Icon colorRed = Icon(
    Icons.check,
    color: Colors.transparent,
  );
  Icon colorOrange = Icon(
    Icons.check,
    color: Colors.transparent,
  );
  Icon colorYellow = Icon(
    Icons.check,
    color: Colors.transparent,
  );
  Icon colorGreen = Icon(
    Icons.check,
    color: Colors.transparent,
  );
  Icon colorBlue = Icon(
    Icons.check,
    color: Colors.transparent,
  );
  Icon colorPurple = Icon(
    Icons.check,
    color: Colors.transparent,
  );

  Widget buildCheckColor() => Row(
        children: <Widget>[
          Container(
            height: 25,
            width: 25,
            margin: EdgeInsets.all(8),
            //padding: EdgeInsets.all(0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                checkColor("red");
              },
              child: FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: colorRed),
            ),
          ),
          Container(
            height: 25,
            width: 25,
            //color: Colors.red,
            margin: EdgeInsets.all(8),
            //padding: EdgeInsets.all(0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                checkColor("orange");
              },
              child: FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: colorOrange),
            ),
          ),
          Container(
            height: 25,
            width: 25,
            //color: Colors.red,
            margin: EdgeInsets.all(8),
            //padding: EdgeInsets.all(0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.yellow),
              onPressed: () {
                checkColor("yellow");
              },
              child: FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: colorYellow),
            ),
          ),
          Container(
            height: 25,
            width: 25,
            //color: Colors.red,
            margin: EdgeInsets.all(8),
            //padding: EdgeInsets.all(0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                checkColor("green");
              },
              child: FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: colorGreen),
            ),
          ),
          Container(
            height: 25,
            width: 25,
            //color: Colors.red,
            margin: EdgeInsets.all(8),
            //padding: EdgeInsets.all(0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                checkColor("blue");
              },
              child: FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: colorBlue),
            ),
          ),
          Container(
            height: 25,
            width: 25,
            //color: Colors.red,
            margin: EdgeInsets.all(8),
            //padding: EdgeInsets.all(0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                checkColor("purple");
              },
              child: FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: colorPurple),
            ),
          ),
        ],
      );
  void checkColor(String colors) {
    colorRed = Icon(
      Icons.check,
      color: Colors.transparent,
    );
    colorOrange = Icon(
      Icons.check,
      color: Colors.transparent,
    );
    colorYellow = Icon(
      Icons.check,
      color: Colors.transparent,
    );
    colorGreen = Icon(
      Icons.check,
      color: Colors.transparent,
    );
    colorBlue = Icon(
      Icons.check,
      color: Colors.transparent,
    );
    colorPurple = Icon(
      Icons.check,
      color: Colors.transparent,
    );
    if (colors == "red") {
      backgroundColor = Colors.red;
      colorRed = new Icon(Icons.check, color: Colors.white);
    } else if (colors == "orange") {
      backgroundColor = Colors.orange;
      colorOrange = new Icon(Icons.check, color: Colors.white);
    } else if (colors == "yellow") {
      backgroundColor = Colors.yellow;
      colorYellow = new Icon(Icons.check, color: Colors.white);
    } else if (colors == "green") {
      backgroundColor = Colors.green;
      colorGreen = new Icon(Icons.check, color: Colors.white);
    } else if (colors == "blue") {
      backgroundColor = Colors.blue;
      colorBlue = new Icon(Icons.check, color: Colors.white);
    } else if (colors == "purple") {
      backgroundColor = Colors.purple;
      colorPurple = new Icon(Icons.check, color: Colors.white);
    }
    setState(() {});
  }

  Widget buildDateTimePickers() => Column(
        children: [
          buildFrom(),
          buildTo(),
        ],
      );

  Widget buildFrom() => buildHeader(
        header: 'From',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(fromDate),
                onClicked: () => pickFromDateTime(pickDate: false),
              ),
            ),
          ],
        ),
      );
  Widget buildTo() => buildHeader(
        header: 'To',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: Utils.toTime(toDate),
                onClicked: () => pickToDateTime(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, date.hour + 1, date.minute);
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );
  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          child,
        ],
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid && fromDate.isBefore(toDate)) {
      final event = Event(
          title: titleController.text,
          description: descriptionController.text,
          from: fromDate,
          to: toDate,
          isAllDay: false,
          backgroundColor: backgroundColor);

      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);
      Navigator.of(context).pop();
    }
  }
}

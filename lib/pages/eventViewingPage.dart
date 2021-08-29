// import 'package:flutter/material.dart';
// import 'package:todo_list/utils.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_list/provider/eventProvider.dart';

// import '../event.dart';

// class EventViewingPage extends StatelessWidget {
//   final Event event;
//   const EventViewingPage({
//     Key? key,
//     required this.event,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: CloseButton(),
//         actions: buildViewingActions(context, event),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(32),
//         children: <Widget>[
//           buildDateTime(event),
//           SizedBox(
//             height: 32,
//           ),
//           Text(event.title, style: TextStyle(fontSize: 24)),
//           SizedBox(
//             height: 24,
//           ),
//           Text(
//             event.description,
//             style: TextStyle(fontSize: 18),
//           )
//         ],
//       ),
//     );
//   }

//   Widget buildDateTime(Event event) {
//     return Column(
//       children: [
//         buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
//         if (!event.isAllDay) buildDate('To', event.to)
//       ],
//     );
//   }


// }

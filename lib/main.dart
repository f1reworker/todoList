import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/authPages/landing.dart';
import 'package:todo_list/provider/authProvider.dart';
import 'package:todo_list/provider/eventProvider.dart';

const myColor = Color.fromRGBO(20, 20, 20, 100);
const myColorPrimary = Color.fromRGBO(12, 10, 13, 1);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'My Todo',
        theme: ThemeData.dark(),

        // accentTextTheme: TextTheme(
        //     bodyText1: TextStyle(color: Colors.white),
        //     bodyText2: TextStyle(color: Colors.white)),
        // primaryTextTheme: TextTheme(
        //     bodyText1: TextStyle(color: Colors.white),
        //     bodyText2: TextStyle(color: Colors.white)),
        // scaffoldBackgroundColor: myColor,
        // primaryColor: myColorPrimary,
        // accentColor: Colors.white,
        // hintColor: Colors.white,
        // // ignore: deprecated_member_use
        // textTheme: TextTheme(title: TextStyle(color: Colors.white70), )

        home: LandingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}



//TODO: воткнуть выполнение до определенного числа, время выполнения, важность, формирование сегодняшнего исходя из этих данных
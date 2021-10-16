import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/pages/authPages/auth.dart';
import 'package:todo_list/pages/authPages/landing.dart';
import 'package:todo_list/services/database.dart';
import 'package:todo_list/provider/eventProvider.dart';

bool _isLoggedIn = isLoggedIn;
dynamic _data;

class AuthProvider with ChangeNotifier {
  bool get isLogggedIn => _isLoggedIn;
  void isLogIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  void getData() {
    databaseReference.child(login).once().then((DataSnapshot snapshot) {
      if (snapshot.value == null) {
        isLogIn(isLoggedIn = true);
        return;
      }
      if (isLogggedIn == false) {
        isLogIn(isLoggedIn = true);
      }
      databaseReference.child(login).once().then((DataSnapshot snapshot) {
        //! Вот это костыли я понаписал
        _data = snapshot.value;
        EventProvider().getEventsCalendar(_data);
      });
    });
  }
}

import 'package:flutter/widgets.dart';
import 'package:todo_list/pages/landing.dart';

bool _isLoggedIn = isLoggedIn;

class AuthProvider with ChangeNotifier {
  bool get isLogggedIn => _isLoggedIn;
  void isLogIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }
}

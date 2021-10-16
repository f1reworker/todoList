import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/navigationBar.dart';
import 'package:todo_list/pages/authPages/auth.dart';
import 'package:todo_list/provider/authProvider.dart';

bool isLoggedIn = false;

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return provider.isLogggedIn ? HomePage() : AuthorizationPage();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: NavigationBar(),
    ));
  }
}

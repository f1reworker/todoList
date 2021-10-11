import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/landing.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/authProvider.dart';

String login = "";
String password = "";
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class AuthorizationPage extends StatelessWidget {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    return Center(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Container(
            height: 318,
            child: Column(
              children: <Widget>[
                buildLogPass("Login"),
                buildLogPass("Password"),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 70,
                  color: Colors.lightGreen[400],
                  child: TextButton(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    onPressed: () {
                      loginIn();
                      provider.isLogIn(isLoggedIn);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.all(0),
                  child: TextButton(
                      onPressed: () {
                        regAndLog();
                      },
                      child: Text("Register and log in")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogPass(String logPass) => Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
      ),
      height: 70,
      child: (TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: logPass,
        ),
        validator: (title) =>
            title != null && title.isEmpty ? '$logPass is not empty' : null,
        controller:
            (logPass == "Login" ? _loginController : _passwordController),
      )));

  void loginIn() async {
    await _firebaseAuth
        .signInWithEmailAndPassword(
            email: _loginController.text, password: _passwordController.text)
        .then((value) {
      print('Login Successful');
      isLoggedIn = true;
    });
  }

  void regAndLog() async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: _loginController.text, password: _passwordController.text);
    loginIn();
  }
}

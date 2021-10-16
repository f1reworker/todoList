import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list/pages/authPages/landing.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/authProvider.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
String login = "";

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
                buildLogPass("Email"),
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
                    onPressed: () async {
                      await _firebaseAuth
                          .signInWithEmailAndPassword(
                              email: _loginController.text.endsWith(" ")
                                  ? _loginController.text.replaceAll(" ", "")
                                  : _loginController.text,
                              password: _passwordController.text)
                          .then((value) {
                        provider.getData();
                        login = _passwordController.text;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.all(0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text("Not registered yet? Register!")),
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
            (logPass == "Email" ? _loginController : _passwordController),
      )));
}

class RegisterPage extends StatelessWidget {
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
                buildLogPass("Email"),
                buildLogPass("Password"),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 70,
                  color: Colors.lightGreen[400],
                  child: TextButton(
                      child: Text(
                        "Register and log in",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_passwordController.text.length < 6) {
                          Fluttertoast.showToast(
                              msg: "Password is less than 6 characters",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          await _firebaseAuth.createUserWithEmailAndPassword(
                              email: _loginController.text.endsWith(" ")
                                  ? _loginController.text.replaceAll(" ", "")
                                  : _loginController.text,
                              password: _passwordController.text);
                          _firebaseAuth
                              .signInWithEmailAndPassword(
                                  email: _loginController.text.endsWith(" ")
                                      ? _loginController.text
                                          .replaceAll(" ", "")
                                      : _loginController.text,
                                  password: _passwordController.text)
                              .then((value) {
                            login = _passwordController.text;
                            isLoggedIn = true;
                            Navigator.of(context).pop();
                            provider.isLogIn(isLoggedIn);
                          });
                        }
                      }),
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
            (logPass == "Email" ? _loginController : _passwordController),
      )));
}

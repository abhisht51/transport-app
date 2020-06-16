import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transport_app/HomePage.dart';
import 'package:transport_app/Screens/loginpage.dart';

class WrapperAuthenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final testingUser = Provider.of<FirebaseUser>(context);

    if (testingUser != null) {
      return MyHomePage1(title: 'Transport App',);
    } else {
      return LoginScreen();
    }
  }
}

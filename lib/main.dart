import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transport_app/services/authentication_services.dart';
import 'HomePage.dart';

import 'package:transport_app/routes/route_generator.dart';

import 'authenticate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthenticationService().user,
          child: MaterialApp(
        title: 'Transport App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        home: WrapperAuthenticate()
        
        //MyHomePage1
        

      ),
    );
  }
}


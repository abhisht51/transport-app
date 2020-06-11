import 'package:flutter/material.dart';
import 'HomePage.dart';

import 'package:transport_app/routes/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transport App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: MyHomePage1
      (
        title: 'Transport App',
      ),

    );
  }
}


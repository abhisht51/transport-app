import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'Screens/FromSNU.dart';
import 'Screens/History.dart';
import 'Screens/To/ToSNU.dart';

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  List<Map> _screens = [
    {
      "title": "Book Shuttle from SNU",
      "child": FromSNU(),
      "icon": Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      )
    },
    {
      "title": "Book Shuttle to SNU",
      "child": ToSNU(),
      "icon": Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      )
    },
    {
      "title": "Booking History",
      "child": History(),
      "icon": Icon(
        Icons.history,
        size: 30,
        color: Colors.white,
      )
    }
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    


    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black45,
        appBar: AppBar(
          title: Text(_screens[_currentIndex]['title']),
          centerTitle: true,
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(
            child: child,
            scale: animation,
          ),
          child: _screens[_currentIndex]['child'],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.deepPurple,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.deepPurple,
          height: 50,
          items: List.generate(
              _screens.length, (index) => _screens[index]['icon']),
          index: _currentIndex,
          animationDuration: Duration(milliseconds: 350),
          animationCurve: Curves.decelerate,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

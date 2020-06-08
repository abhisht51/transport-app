import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Screens/FromSNU.dart';
import 'Screens/History.dart';
import 'Screens/ToSNU.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> _screens = [
    {
      "child": ToSNU(),
      "icon": Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      )
    },
    {
      "child": FromSNU(),
      "icon": Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      )
    },
    {
      "child": History(),
      "icon": Icon(
        Icons.remove,
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
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: _screens[_currentIndex]['child'],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.deepPurple,
          
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.deepPurple,
          height: 50,
          items: <Widget>[
            Icon(Icons.add, size: 30, color: Colors.white),
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.remove, size: 30, color: Colors.white),
          ],
          index: _currentIndex, // For the default option (currently home)
          animationDuration: Duration(milliseconds: 350),
          animationCurve: Curves.decelerate,
          onTap: (index) {
            print("Current Index is: $index");
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
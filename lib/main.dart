import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Transport App',
        
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // TabItem currentTab = TabItem.red;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Testing",
              style: TextStyle(
                // color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.pink,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white ,
        height: 50,
        items: <Widget>[
          Icon(Icons.add,size:20,color:Colors.black),
          Icon(Icons.home,size:20,color:Colors.black),
          Icon(Icons.remove,size:20,color:Colors.black),
        ],
        index: 1, // For the default option (currently home)
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.decelerate,
        onTap: (index){
          debugPrint("Current Index is: $index");

        },

      
      ),
    );
  }
}

_getNavBar(context) {}

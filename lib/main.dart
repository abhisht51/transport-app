import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:transport_app/pages/ToSNU.dart';
import 'package:transport_app/pages/fromSNU.dart';
import 'package:transport_app/pages/homepage.dart';
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
      home: MyHomePage(
        title: 'Transport App',
      ),

    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.purple,
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.green,
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
  int pageIndex = 1;

  final FromSNU _fromSNU = FromSNU();
  final Homepage _home = Homepage();
  final ToSNU _toSNU = ToSNU();

  // ERROR PAGE

  Widget _showPage = new Homepage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _fromSNU;
        break;
      case 1:
        return _toSNU;
        break;
      case 2:
        return _home;
        break;
      default:
        return Container(
          color: Colors.black,
          child: Text("No such pages"),
        );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,        
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.pink,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.pink,

        height: 50,
        items: <Widget>[
          Icon(Icons.add, size: 20, color: Colors.white),
          Icon(Icons.open_in_browser, size: 20, color: Colors.white),
          Icon(Icons.remove, size: 20, color: Colors.white),
        ],
        index: pageIndex, // For the default option (currently home)
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.decelerate,

        onTap: (index) {
          debugPrint("Current Index is: $index");
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _showPage,
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('', arguments: "Abhisht");
                },
                child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
              ),
            ],
            // child : _showPage
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       "Testing",
          //       style: TextStyle(
          //           // color: Colors.redAccent,
          //           ),
          //     ),
          
          //     RaisedButton(
          //         child: Text('Go To Page of index 1'),
          //         onPressed: () {
          //           //Page change using state does the same as clicking index 1 navigation button
          //           final CurvedNavigationBarState navBarState =
          //               _bottomNavigationKey.currentState;
          //           navBarState.setPage(1);
          //         },
          //       )
          //   ],
          // ),
        ),
      ),
      
    );
  }
}

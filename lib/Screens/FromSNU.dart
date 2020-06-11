import 'package:flutter/material.dart';

class FromSNU extends StatefulWidget {
  @override
  _FromSNUState createState() => _FromSNUState();
}

class _FromSNUState extends State<FromSNU> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('');
              },
              color: Colors.deepPurpleAccent,
              child: Text("Hello"),
              elevation: 5,
              shape: StadiumBorder(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('');
              },
              color: Colors.deepPurpleAccent,
              child: Text("from"),
              shape: StadiumBorder(),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/toSNU', arguments: "Hello Friend");
            },
            color: Colors.deepPurpleAccent,
            child: Text("Hello from the other side"),
            padding: EdgeInsets.fromLTRB(90, 5, 90, 5),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('');
            },
            color: Colors.deepPurpleAccent,
            child: Text("Hello from the other side"),
            padding: EdgeInsets.fromLTRB(90, 5, 90, 5),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return makeCard;
        },
      ),
    );
  }
}

final makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.deepPurple.shade500,
    ),
    // TODO: Pass data object here
    child: makeListTile(),
  ),
);

ListTile makeListTile() => ListTile(
    onTap: () {
      debugPrint("Helllo");
    },
    // hoverColor: Colors.black,
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.cake, color: Colors.white),
    ),
    title: Text(
      "Testing",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));

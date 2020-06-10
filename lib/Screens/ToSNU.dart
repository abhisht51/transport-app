import 'package:flutter/material.dart';

class ToSNU extends StatefulWidget {
  @override
  _ToSNUState createState() => _ToSNUState();
}

class _ToSNUState extends State<ToSNU> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Icon(Icons.ac_unit, size: 50),
      
    );
  }
}
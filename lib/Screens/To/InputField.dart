import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final String title;
  final IconData icon;

  InputField({@required this.label, @required this.icon, this.title, Key key})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.deepPurple, width: 2)),
      child: TextFormField(
        style: TextStyle(fontSize: 22),
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: Colors.deepPurple,
          ),
          labelText: "SNU Roll Number",
          labelStyle: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
              fontSize: 18),
          // focusedBorder: ,
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

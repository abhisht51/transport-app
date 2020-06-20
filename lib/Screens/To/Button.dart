import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  String title;
  String subTitle;
  Function onTap;
  IconData icon;

  Button({Key key, this.title, this.onTap, this.subTitle, this.icon}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      splashColor: Colors.deepPurpleAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      borderSide: BorderSide(color: Colors.deepPurple, width: 2),
      onPressed: widget.onTap,
      label: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(color: Colors.deepPurple, fontSize: 22),
            ),
            if (widget.subTitle != null)
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  widget.subTitle,
                  style: TextStyle(color: Colors.grey),
                ),
              )
          ],
        ),
      ),
      icon: Icon(widget.icon, color: Colors.deepPurple),
    );
  }
}

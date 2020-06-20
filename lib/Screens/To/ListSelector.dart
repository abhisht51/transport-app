import 'package:flutter/material.dart';

import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:direct_select_flutter/direct_select_item.dart';

class ListSelector extends StatefulWidget {
  List listData;
  IconData icon;
  String title;

  ListSelector({Key key, this.listData, this.icon, this.title}) : super(key: key);

  @override
  _ListSelectorState createState() => _ListSelectorState();
}

class _ListSelectorState extends State<ListSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.deepPurple,
          ),
          SizedBox(width: 5,),
          Expanded(
              child: DirectSelectList<String>(
            values: [widget.title, ...widget.listData],
            itemBuilder: (String value) {
              return DirectSelectItem<String>(
                  itemHeight: 56,
                  value: value,
                  itemBuilder: (context, value) {
                    return Text(value, style: TextStyle(color: Colors.deepPurple, fontSize: 22),);
                  });
            },
            focusedItemDecoration: BoxDecoration(
              // color: Colors.deepPurple,
              border: BorderDirectional(
                bottom: BorderSide(width: 1, color: Colors.black12),
                top: BorderSide(width: 1, color: Colors.black12),
              ),
            ),
          )),
          Icon(Icons.unfold_more)
        ],
      ),
    );
  }
}

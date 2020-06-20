import 'package:flutter/material.dart';
import 'package:transport_app/Screens/To/ListSelector.dart';
import 'package:transport_app/data/ToData.dart';
import 'package:direct_select_flutter/direct_select_container.dart';

// Temporary imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transport_app/Screens/To/Button.dart';
import 'package:transport_app/Screens/To/InputField.dart';

class ToSNU extends StatefulWidget {
  @override
  _ToSNUState createState() => _ToSNUState();
}

class _ToSNUState extends State<ToSNU> {
  String email;
  String password;

  final _auth = FirebaseAuth.instance;

  static DateTime _today = DateTime.now().add(Duration(days: 1));
  static DateTime _chosenDate = _today;

  static ToData _toData = ToData();
  static dynamic _locations = _toData.getLocations(_chosenDate.weekday);
  dynamic _timings =
      _toData.getTimings(_chosenDate.weekday, _toData.data['1'][0]['location']);

  int _seats = 1;

  @override
  Widget build(BuildContext context) {
    Size _dynamicSize = MediaQuery.of(context).size;
    return DirectSelectContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InputField(
              label: 'SNU Roll Number',
              icon: Icons.person,
            ),
            Button(
              title:
                  "${_chosenDate.day}-0${_chosenDate.month}-${_chosenDate.year}",
              subTitle: "Select Booking Date",
              onTap: () async {
                DateTime newDate = await showDatePicker(
                    context: context,
                    initialDate: _chosenDate,
                    firstDate: _today,
                    lastDate: _today.add(Duration(days: 7)));
                if (newDate != _chosenDate && newDate != null)
                  setState(() {
                    _chosenDate = newDate;
                    _locations = _toData.getLocations(_chosenDate.weekday);
                    _timings = _toData.getTimings(
                        _chosenDate.weekday, _toData.data['1'][0]['location']);
                  });
              },
              icon: Icons.date_range,
            ),
            ListSelector(
              listData: _locations,
              icon: Icons.location_on,
              title: "Select Booking Location",
            ),
            ListSelector(
              listData: _timings,
              icon: Icons.access_time,
              title: "Select Booking Time",
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        color: _seats > 1 ? Colors.deepPurple : Colors.grey,
                        onPressed: () {
                          _seats > 1
                              ? setState(() {
                                  _seats--;
                                })
                              : null;
                        },
                        icon: Icon(Icons.remove),
                      ),
                      SizedBox(
                        width: 2,
                        child: Container(
                          color: Colors.deepPurple,
                          height: 50,
                        ),
                      ),
                      Text(
                        "$_seats",
                        style:
                            TextStyle(fontSize: 22, color: Colors.deepPurple),
                      ),
                      SizedBox(
                        width: 2,
                        child: Container(
                          color: Colors.deepPurple,
                          height: 50,
                        ),
                      ),
                      IconButton(
                        color: Colors.deepPurple,
                        onPressed: () {
                          setState(() {
                            _seats++;
                          });
                        },
                        icon: Icon(Icons.add),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Text(
                      "Number of Seats",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: _dynamicSize.width / 2,
              height: 50,
              child: RaisedButton(
                splashColor: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.deepPurple,
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: MediaQuery.of(context).size.height,
  //     width: MediaQuery.of(context).size.width,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         TextField(
  //             onChanged: (value) {
  //               debugPrint(value);
  //               email=value;
  //             },
  //             onSubmitted: (value){
  //               debugPrint(value);
  //             },
  //             textAlign: TextAlign.center,
  //             decoration: InputDecoration(
  //               border: OutlineInputBorder(),
  //               labelText: 'Username',
  //             )
  //             ),
  //             SizedBox(
  //               height: 8.0,
  //             ),
  //           TextField(
  //             onChanged: (value) {
  //               debugPrint("Helllo"+value);
  //               password = value;
  //             },
  //             onSubmitted: (value){
  //               debugPrint(value);
  //             },
  //             obscureText: true,
  //             textAlign: TextAlign.center,
  //             decoration: InputDecoration(
  //               border: OutlineInputBorder(),
  //               labelText: 'Username',
  //             )
  //             ),
  //             SizedBox(
  //           width: MediaQuery.of(context).size.width - 10,
  //           child: RaisedButton(
  //             onPressed: () async {
  //               debugPrint(email);
  //               debugPrint(password);
  //               try {
  //               final status = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //                 if(status != null){
  //                   debugPrint("HEYYYYYYYYYYYYYYYYYYYYYYY");
  //                   print("Hello :) ");
  //                 }
  //               }
  //               catch(e){
  //                 print(e);
  //               }

  //             },
  //             color: Colors.deepPurple.shade400,
  //             child: Text("Submit"),
  //             elevation: 5,
  //             shape: StadiumBorder(),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';

// Temporary imports 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transport_app/services/authentication_services.dart';


class ToSNU extends StatefulWidget {
  @override
  _ToSNUState createState() => _ToSNUState();
}

class _ToSNUState extends State<ToSNU> {
  String email;
  String password;

  final _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
              onChanged: (value) {
                debugPrint(value);
                email=value;
              },
              onSubmitted: (value){
                debugPrint(value);
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              )
              ),
              SizedBox(
                height: 8.0,
              ),
            TextField(
              onChanged: (value) {
                debugPrint("Helllo"+value);
                password = value;
              },
              onSubmitted: (value){
                debugPrint(value);
              },
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              )
              ),
              SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            child: RaisedButton(
              onPressed: () async {
                debugPrint(email);
                debugPrint(password);
                var user = await AuthenticationService().signUpWithEmail(email: email, password: password);
                debugPrint("Kya dukh hai ");
              },
              color: Colors.deepPurple.shade400,
              child: Text("Submit"),
              elevation: 5,
              shape: StadiumBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

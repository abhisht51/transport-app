import 'package:flutter/material.dart';
import 'package:transport_app/services/authentication_services.dart';

class FromSNU extends StatefulWidget {
  @override
  _FromSNUState createState() => _FromSNUState();
}

class _FromSNUState extends State<FromSNU> {
  @override
  Widget build(BuildContext context) {

    final AuthenticationService _auth = AuthenticationService();

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              color: Colors.deepPurpleAccent,
              child: Text("Login Page"),
              elevation: 5,
              shape: StadiumBorder(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              color: Colors.deepPurpleAccent,
              child: Text("Sign Up Page"),
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
            onPressed: () async {
              // Navigator.of(context).pushNamed('');
              await _auth.signOut();
            },
            color: Colors.deepPurpleAccent,
            child: Text("Logout!!!"),
            padding: EdgeInsets.fromLTRB(90, 5, 90, 5),
          ),
        ],
      ),
    );
  }
}

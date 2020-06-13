import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:transport_app/HomePage.dart';
import 'package:transport_app/Screens/loginpage.dart';
import 'package:transport_app/Screens/signup.dart';
import 'package:transport_app/main.dart';
>>>>>>> 8a8d1be4fbcd68dfdfd50f88687fa9524decbc01

import '../routeexample.dart';


class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=>LoginScreen(),maintainState: true,fullscreenDialog: true); 

      case '/toSNU':
        if(args is String){
          return MaterialPageRoute(
           
            builder: (_)=>To_SNU(data: args,)
          );
        }
         return _errorRoute();  
       break;
      case '/login':
        return MaterialPageRoute(builder: (_)=>LoginScreen(),maintainState: true,fullscreenDialog: true);
      case '/signup':
        return MaterialPageRoute(builder: (_)=>SignUp(),maintainState: true,fullscreenDialog: true);
      default:
         return _errorRoute();
        
    }

  }

   static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}



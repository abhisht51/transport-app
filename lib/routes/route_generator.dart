import 'package:flutter/material.dart';

import '../routeexample.dart';


class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=>OOOF(),maintainState: true,fullscreenDialog: true); 

      case '/toSNU':
        if(args is String){
          return MaterialPageRoute(
           
            builder: (_)=>To_SNU(data: args,)
          );
        }
         return _errorRoute();  
       break;
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



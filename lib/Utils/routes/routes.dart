

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';

class Routes{
  static Route<dynamic>  generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginView());

      default:
        return MaterialPageRoute(builder: (_){
        return Scaffold(
          body: Center(
            child: Text('NO routes Define'),
          ),
        );
        });

    }
  }
}
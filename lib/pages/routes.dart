import 'package:arm/pages/ajouter.dart';
import 'package:arm/pages/item_details.dart';
import 'package:arm/pages/listevetements.dart';
import 'package:arm/pages/login.dart';
import 'package:arm/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:arm/main.dart';

import 'home.dart';


class MyRoutes{
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    String arg=settings.arguments.toString();
    switch(settings.name){
      case'/': return MaterialPageRoute(builder: (context)=>homepage());
      case'/login/': return MaterialPageRoute(builder: (context)=>SignInScreen());
      case'/register/': return MaterialPageRoute(builder: (context)=>SignUpScreen());
      case'/home': return MaterialPageRoute(builder: (context)=>home());
      case'/listevetements': return MaterialPageRoute(builder: (context)=>ItemList());
      case'/itemdetails': return MaterialPageRoute(builder: (context)=>ItemDetails(arg));
      case'/ajouter': return MaterialPageRoute(builder: (context)=>MyForm());
      
    }
    return MaterialPageRoute(builder: (_){
      return Text('error');
    });
  }

}
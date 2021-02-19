import 'dart:async';

import 'package:diet_controller/presentation/pages/food_screen.dart';
import 'package:diet_controller/presentation/pages/home_screen.dart';
import 'package:diet_controller/presentation/pages/login_screen.dart';
import 'package:diet_controller/presentation/pages/splash_screen.dart';
import 'package:diet_controller/utils/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterState extends ChangeNotifier{
  static String currentRoute;
  static final StreamController<String> routesStream = StreamController.broadcast();

  coseStream(){
    routesStream.close();
  }

  void setCurrentRoute(String route)=>currentRoute = route;

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':{
        currentRoute = KRoutes.loginScreen;
        return MaterialPageRoute(
          builder: (_)=>LoginScreen(),
          settings: settings
        );
      }
      case '/foodScreen':{
        currentRoute = KRoutes.foodScreen;
        return MaterialPageRoute(
          builder: (_)=>FoodScreen(),
          settings: settings
        );
      }
      case '/dashboard':{
        currentRoute = KRoutes.dashboard;
        return MaterialPageRoute(
          builder: (_)=>HomeScreen(),
          settings: settings
        );
      }
      case '/loginScreen':{
        currentRoute = KRoutes.loginScreen;
        return MaterialPageRoute(
          builder: (_)=>LoginScreen(),
          settings: settings
        );
      }
      case '/splashScreen':{
        currentRoute = KRoutes.splashScreen;
        return MaterialPageRoute(
          builder: (_)=>SplashScreen(),
          settings: settings
        );
      }
      default:
        return MaterialPageRoute(
          builder: (_)=>HomeScreen(),
          settings: settings
        );
    }
  }
}
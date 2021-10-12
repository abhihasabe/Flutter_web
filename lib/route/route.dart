import 'package:flutter/material.dart';
import 'package:news_app/animation/nav_slide_from_left.dart';
import 'package:news_app/screens/dashboard/ui/dashboard_screen.dart';
import 'package:news_app/screens/splash_screen.dart';

// route names
const String splashPage = 'splash';
const String loginPage = 'login';
const String registerPage = 'register';
const String homePage = 'home';

// controller function to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashPage:
      return MaterialPageRoute(builder: (context) => Splash());
    case homePage:
      return NavSlideFromLeft(page: Dashboard());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

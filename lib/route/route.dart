import 'package:flutter/material.dart';
import 'package:news_app/screens/document/ui/document_screen.dart';
import 'package:news_app/animation/nav_slide_from_left.dart';
import 'package:news_app/animation/nav_slide_from_top.dart';
import 'package:news_app/screens/PreSales/ui/create_enquiry.dart';
import 'package:news_app/screens/PreSales/ui/presale_screen.dart';
import 'package:news_app/screens/Sales/ui/sales_screen.dart';
import 'package:news_app/screens/dashboard/ui/dashboard_screen.dart';
import 'package:news_app/screens/splash_screen.dart';

// route names
const String splashPage = 'splash';
const String loginPage = 'login';
const String registerPage = 'register';
const String homePage = 'home';
const String helpDesk = 'helpDesk';
const String document = 'document';
const String preSalePage = 'preSalePage';
const String salesPage = 'salesPage';
const String createEnquiry = 'createEnquiry';
const String displayEnquiry = 'displayEnquiry';

// controller function to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashPage:
      return MaterialPageRoute(builder: (context) => Splash());
    case homePage:
      return NavSlideFromLeft(page: Dashboard());
    case document:
      return MaterialPageRoute(builder: (context) => DocumentScreen());
    case preSalePage:
      return MaterialPageRoute(builder: (context) => PreSaleScreen());
    case createEnquiry:
      return MaterialPageRoute(builder: (context) => CreateEnquiry());
    case salesPage:
      return MaterialPageRoute(builder: (context) => SaleScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

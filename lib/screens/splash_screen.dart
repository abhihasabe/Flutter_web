import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/animation/nav_slide_fade.dart';
import 'package:news_app/route/route.dart' as route;

import 'dashboard_screen.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Splash();
  }
}

class _Splash extends State {
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.popAndPushNamed(context, route.homePage));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: key,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.supervised_user_circle_outlined, size: 100)),
        ],
      ),
    );
  }
}

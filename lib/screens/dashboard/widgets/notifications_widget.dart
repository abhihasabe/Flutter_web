import 'package:flutter/material.dart';

class Notifications extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Notifications();
  }

}

class _Notifications extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(children: [
       Text("16 sep 2021"),
       Text("John Deo replied on your ticket"),
        Divider(), Text("16 sep 2021"),
       Text("John Deo replied on your ticket"),
        Divider(), Text("16 sep 2021"),
       Text("John Deo replied on your ticket"),
        Divider()
      ]),
    );
  }
}
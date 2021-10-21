import 'package:flutter/material.dart';

/*class Statistics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Statistics();
  }
}*/

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Expanded(child: Text("My Tickets")),
              Divider(
                color: const Color(0xFF000000),
                height: 2,
                thickness: 2,),
              Expanded(child: Text("1"))
        ]),
        Column(children: [
          SizedBox(height: 20,),
          Expanded(child: Text("My Tickets")),
          Divider(
              color: Color(0xFF000000),
              height: 2,
              thickness: 2,),
          Expanded(child: Text("1"))
        ]),
        Column(children: [
          SizedBox(height: 20,),
          Expanded(child: Text("My Tickets")),
          Divider(
              color: const Color(0xFF000000),
              height: 2,
              thickness: 2,),
          Expanded(child: Text("1"))
        ])
      ]),
    );
  }
}

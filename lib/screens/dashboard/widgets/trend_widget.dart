import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TrendsWidget extends StatefulWidget {

  String trendTitle;
  String subTrendTitle;

  TrendsWidget(this.trendTitle, this.subTrendTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TrendsWidget(trendTitle, subTrendTitle);
  }
}

class _TrendsWidget extends State {

  _TrendsWidget(this.trendTitle, this.subTrendTitle);

  String trendTitle;
  String subTrendTitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Column(children: [
      Row(children: [
        Text("$trendTitle", style: TextStyle(fontSize: 14)),
      ])
    ]));
  }
}

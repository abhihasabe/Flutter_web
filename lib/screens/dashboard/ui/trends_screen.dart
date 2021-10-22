import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/dashboard/widgets/line_chart_widget.dart';
import 'package:news_app/screens/dashboard/widgets/notifications_widget.dart';
import 'package:news_app/screens/dashboard/widgets/statistics.dart';

class Trends extends StatefulWidget {
  const Trends({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Trends();
}

class _Trends extends State<Trends> {
  bool? isShowingMainData;
  bool? displayMobileLayout;
  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    displayMobileLayout= MediaQuery.of(context).size.width < 600;
    return !displayMobileLayout!?
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "TRENDS",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: !displayMobileLayout!?Axis.horizontal:Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: _trendListBuilder,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "STATISTICS",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: !displayMobileLayout!?Axis.horizontal:Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: _statisticsListBuilder,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: !displayMobileLayout!?Axis.horizontal:Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: _statisticsListBuilder,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                    child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Padding(
                          padding: const EdgeInsets.only( top: 8),
                          child: Text("NOTIFICATION",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold),

                          ),
                        ),
                            Padding(
                              padding: const EdgeInsets.only(right:12.0, top: 8),
                              child: Icon(Icons.notifications_active_outlined, color: Colors.cyan,),
                            )
                      ]),
                      SizedBox(height: 10,),
                      Text("16 sep 2021"),
                      Text("John Deo replied on your ticket"),
                      Divider(),
                      Text("16 sep 2021"),
                      Text("John Deo replied on your ticket"),
                      Divider(),
                      Text("16 sep 2021"),
                      Text("John Deo replied on your ticket"),
                      Divider()
                    ]),
                  ),
                )),
                SizedBox(
                    child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0, bottom: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                      Text("ESSENTIAL TIPS", style: TextStyle(
                          fontSize: 14,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      Text("John Deo replied on your ticket. John Deo replied on your ticket. "
                          "John Deo replied on your ticket.John Deo replied on your ticket"),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Align(child: Icon(Icons.settings, size: 58, color: Colors.grey), alignment: Alignment.centerRight),
                          )
                    ]),
                  ),
                )),
              ],
            )),
        SizedBox(width: 20,)
      ],
    ):
    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      SizedBox(
        height: 2150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "TRENDS",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: !displayMobileLayout!?Axis.horizontal:Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: _trendListBuilder,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "STATISTICS",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: !displayMobileLayout!?Axis.horizontal:Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: _statisticsListBuilder,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: !displayMobileLayout!?Axis.horizontal:Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: _statisticsListBuilder,
              ),
            ),
          ],
        ),
      ),
      Column(
        children: [
          SizedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only( top: 8),
                                child: Text("NOTIFICATION",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold),

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:12.0, top: 8),
                                child: Icon(Icons.notifications_active_outlined, color: Colors.cyan,),
                              )
                            ]),
                        SizedBox(height: 10,),
                        Text("16 sep 2021"),
                        Text("John Deo replied on your ticket"),
                        Divider(),
                        Text("16 sep 2021"),
                        Text("John Deo replied on your ticket"),
                        Divider(),
                        Text("16 sep 2021"),
                        Text("John Deo replied on your ticket"),
                        Divider()
                      ]),
                ),
              )),
          SizedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0, bottom: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text("ESSENTIAL TIPS", style: TextStyle(
                            fontSize: 14,
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold)),
                        SizedBox(height: 10,),
                        Text("John Deo replied on your ticket. John Deo replied on your ticket. "
                            "John Deo replied on your ticket.John Deo replied on your ticket"),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Align(child: Icon(Icons.settings, size: 58, color: Colors.grey), alignment: Alignment.centerRight),
                        )
                      ]),
                ),
              )),
        ],
      ),
      SizedBox(width: 20,)
    ]);
  }

  Widget _trendListBuilder(BuildContext context, int index) {
    var colorList = [Colors.blueAccent, Colors.red, Colors.pink];
    var cardNameList = ["Sales Trend", "Service Trend", "Service Trend"];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: !displayMobileLayout!?100:240,
        child: Column(children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0, right: 8),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("${cardNameList[index]}", style: TextStyle(fontSize: 14)),
              SizedBox(
                width: MediaQuery.of(context).size.width / 14,
              ),
              Text("Details")
            ]),
          ),
          SizedBox(height: 20),
          Container(
            height: 132,
            child: AspectRatio(
              aspectRatio: 02,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 22.0, left: 8.0),
                  child: LineCharts(isShowingMainData: false),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _statisticsListBuilder(BuildContext context, int index) {
    var colorList = [Colors.blueAccent, Colors.red, Colors.pink];
    var cardNameList = ["Tickets", "Enquiries", "Enquiries"];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(children: [
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${cardNameList[index]}", style: TextStyle(fontSize: 14)),
            SizedBox(
              width: MediaQuery.of(context).size.width / 11,
            ),
            Text("Details")
          ]),
        ),
        SizedBox(height: 20),
        Container(
          height: 133,
          child: AspectRatio(
            aspectRatio: 02,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                child: Statistics(),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

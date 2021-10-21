import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:news_app/route/route.dart' as route;
import 'package:news_app/screens/PreSales/ui/EnquiryDetails/EnquiryDetailWeb.dart';
import 'package:news_app/screens/PreSales/ui/create_enquiry.dart';
import 'package:news_app/screens/PreSales/ui/display_enquiry.dart';
import 'package:news_app/screens/helpdesk/ui/ticket_details.dart';
import 'package:news_app/screens/helpdesk/widget/helpdesk_mob_card.dart';
import 'package:news_app/screens/helpdesk/widget/helpdesk_web_card.dart';
import 'package:news_app/theme/colors.dart';
import 'package:news_app/theme/dimens.dart';
import 'package:news_app/theme/theme.dart';
import 'package:news_app/utils/dialog.helper.dart';
import 'package:news_app/widgets/button.dart';


class HelpDeskScreen extends StatefulWidget {
  const HelpDeskScreen({Key? key}) : super(key: key);

  @override
  _HelpDeskScreenState createState() => _HelpDeskScreenState();
}

class _HelpDeskScreenState extends State<HelpDeskScreen> with TickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> topBarAnimation;

  final ScrollController scrollController = ScrollController();
  final TextEditingController roleController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double topBarOpacity = 0.0;
  int _index = 0;
  String? firstName="ss", lastName="ss", role;
  Animation? animation;
  int count = 9;
  bool? displayMobileLayout;


  @override
  void initState() {
    // TODO: implement initState


    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn)));

    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    super.initState();


  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    displayMobileLayout= MediaQuery.of(context).size.width < 600;
    return Container(
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          key: _scaffoldKey,
          body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('images/background.png'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: [
                    getAppBarUI(),
                    !displayMobileLayout!?getMainWebUI():getMainViewUI(),
                    getListView()
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: Visibility(
            child: Container(
              height: 50,
              child: !kIsWeb?FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(
                        builder: (context) =>CreateEnquiry()));
                  },
                  child: Icon(Icons.playlist_add,color: Colors.white),
                  backgroundColor: accentColor):Container(),
            ),
          ),
        ),
      ),

    );

  }

  Widget getMainWebUI() {
    return Padding(
      padding: const EdgeInsets.only(left:50.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 20,left: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:4.0,left: 10.0,right: 10),
                      child: Text("My Tickets",style: TextStyle(color: Colors.grey,fontSize:countTextSize),),
                    ),
                    Container(
                      width: circleWidth,
                      height: circleHeight,
                      child: Center(child: Text("06",style: TextStyle(color: Colors.black,fontSize:countTextSize))),
                      decoration: new BoxDecoration(
                          border: Border.all(width: 1.0,color: Colors.blue),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          )
                      ),

                      // color: Color(C)),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 20,left: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:4.0,right: 10),
                      child: Text("Pending on me",style: TextStyle(color: Colors.grey,fontSize:countTextSize),),
                    ),
                    Container(
                      width: circleWidth,
                      height: circleHeight,
                      child: Center(child: Text("06",style: TextStyle(color: Colors.black,fontSize:countTextSize))),
                      decoration: new BoxDecoration(
                          border: Border.all(width: 1.0,color: Colors.deepOrange),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          )
                      ),
                      // color: Color(C)),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 20,left: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:4.0,right: 10),
                      child: Text("Resolved",style: TextStyle(color: Colors.grey,fontSize:countTextSize)),
                    ),
                    Container(
                      width: circleWidth,
                      height: circleHeight,
                      child: Center(child: Text("06",style: TextStyle(color: Colors.black,fontSize:countTextSize))),
                      decoration: new BoxDecoration(
                          border: Border.all(width: 1.0,color: Colors.green),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          )
                      ),
                      // color: Color(C)),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:38.0),
                child: Container(
                  width: MediaQuery.of(context).size.width/4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search,color: Colors.black),
                          ),
                          border: InputBorder.none,
                          filled: false,
                          hintText: 'Search',
                          contentPadding: const EdgeInsets.only(
                            left: 16,
                            right: 20,
                            top: 16,
                            bottom: 0,
                          ),
                        ),
                        onChanged: (String txt) {
                        }),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ButtonWidget(
                        label: "Create New",
                        onPress: () async {
                          Navigator.push(context,  MaterialPageRoute(
                              builder: (context) =>CreateEnquiry()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget getMainViewUI() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Column(
                children: [
                  Container(
                    width: circleWidth,
                    height: circleHeight,
                    child: Center(child: Text("06",style: TextStyle(color: Colors.black,fontSize:countTextSize))),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.0,color: Colors.blue)),
                    // color: Color(C)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Text("My Tickets",style: TextStyle(color: Colors.grey,fontSize:countTextSize),),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Column(
                children: [
                  Container(
                    width: circleWidth,
                    height: circleHeight,
                    child: Center(child: Text("06",style: TextStyle(color: Colors.black,fontSize:countTextSize))),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.0,color: Colors.deepOrange)),
                    // color: Color(C)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Text("Pending on me",style: TextStyle(color: Colors.grey,fontSize:countTextSize),),
                  )
                ],
              ),
            ), Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Column(
                children: [
                  Container(
                    width: circleWidth,
                    height: circleHeight,
                    child: Center(child: Text("06",style: TextStyle(color: Colors.black,fontSize:countTextSize))),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.0,color: Colors.green)),
                    // color: Color(C)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Text("Resolved",style: TextStyle(color: Colors.grey,fontSize:countTextSize)),
                  )
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color:primaryColor,
        boxShadow: <BoxShadow>[],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 10, right: 0),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: 50,
              height: 60,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(0.0),
                  ),
                  onTap: () {

                    Navigator.pop(context);
//                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'HelpDesk',
              style: TextStyle(
                color: Colors.white,
                fontSize: MyThemes.FontTitle,
              ),
            ),
            /*Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        child: Center(
                          child: Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget getListView()
  {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.only(top: 8),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int i) {
//          final int count = enqList.length > 10 ? 10 : enqList.length;
            final Animation<double> animation =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: animationController,
                curve: Interval((1 / 100) * i, 1.0,
                    curve: Curves.fastOutSlowIn)));
            animationController.forward();
            return AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? child) {
                  return FadeTransition(
                    opacity: animation,
                    child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, 50 * (1.0 - animation.value), 0.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 0),
                        child: InkWell(
                          onTap: () {
                            if(kIsWeb)
                            {
                              Navigator.push(context,  MaterialPageRoute(
                                  builder: (context) =>EnquiryDetailWeb()));
                            }
                            else
                            {
                              Navigator.push(context,  MaterialPageRoute(
                                  builder: (context) =>TicketDetails()));
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      !displayMobileLayout!?
                                      hdWebCard():
                                      hdMobCard(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),

      ),

    );
  }

  Future<bool> _onBackPressed() async
  {
    await DialogHelper.showScaleAlertBox(
      title: Center(child: Text("Exit!")),
      // IF YOU WANT TO ADD
      context: context,
      firstButton: FlatButton(
        // FIRST BUTTON IS REQUIRED
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(40),
//        ),
        color: Colors.white,
        child: Text('YES', style: TextStyle(color: primaryColor)),
        onPressed: () async {
          Navigator.of(context).pop();
          exit(0);
        },
      ),
      secondButton: FlatButton(
        // OPTIONAL BUTTON
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(40),
//        ),
        color: Colors.white,
        child: Text(
          'NO',
          style: TextStyle(color:primaryColor),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      yourWidget: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('You want to Exit Application?'),
        ),
      ),


//      icon: Icon(
//        Icons.info_outline,
//        color: Colors.white,
//      ), // IF YOU WANT TO ADD ICON
    );
    return true;
  }
}
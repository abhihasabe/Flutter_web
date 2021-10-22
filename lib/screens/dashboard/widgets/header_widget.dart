import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/utils/date_picker.dart';
import 'package:news_app/screens/document/ui/components/document_auto_completer_widget.dart';
import 'package:news_app/screens/document/ui/components/document_button.dart';
import 'package:news_app/screens/document/ui/components/document_dropdown_widget.dart';
import 'package:webfeed/domain/media/media.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidget createState() =>
      _HeaderWidget();
}

class _HeaderWidget extends State<HeaderWidget> {

  bool? displayMobileLayout;

  @override
  Widget build(BuildContext context) {
    displayMobileLayout= MediaQuery.of(context).size.width < 600;
    return Container(
      color: Colors.white,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:28.0),
            child: Text("Dashboard > KPL"),
          ),
          SizedBox(
            width: !displayMobileLayout!?MediaQuery.of(context).size.width/2.2:MediaQuery.of(context).size.width/4,
          ),
          Container(
              height: 40,
              padding: EdgeInsets.only(top: 5, left: 10),
              alignment: Alignment.center,
              width: 200,
              child: DashboardAutoComplete(hintName:"Global Search")),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

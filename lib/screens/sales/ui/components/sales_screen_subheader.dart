import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/screens/document/ui/components/document_auto_completer_widget.dart';
import 'package:news_app/screens/sales/ui/components/sales_button.dart';
import 'package:news_app/screens/sales/ui/components/sales_screen_filter_tab.dart';

class SalesScreenSubHeader extends StatefulWidget {
  const SalesScreenSubHeader({Key? key}) : super(key: key);

  @override
  _SalesScreenSubHeaderState createState() => _SalesScreenSubHeaderState();
}

class _SalesScreenSubHeaderState extends State<SalesScreenSubHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width / 6) / 3,
            ),
            SalesScreenFilterTab(),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 4) / 2,
            ),
            Container(
                height: 50,
                padding: EdgeInsets.only(top: 5, left: 10),
                alignment: Alignment.center,
                width: 200,
                child: DashboardAutoComplete(hintName: "Global Search")),
            SizedBox(
              width: 5,
            ),
            SalesCustomButton(
              clickFunction: () {},
              color: Colors.blue,
              showText: 'Create New',
              textColor: Colors.white,
              key: ValueKey('New'),
            )
          ],
        ),
      ),
    );
  }
}

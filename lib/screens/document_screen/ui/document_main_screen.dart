import 'package:flutter/material.dart';
import 'document_body/document_body.dart';
import 'document_header.dart';
import 'document_table.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({Key? key}) : super(key: key);

  @override
  _DashboardMainScreenState createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: ScrollController(),
        shrinkWrap: true,
        children: [
          DocumentScreenHeader(),
          DocumentScreenSubHeader(),
          SizedBox(
            height: 20,
          ),
          DocumentTableScreen()
        ],
      ),
    );
  }
}

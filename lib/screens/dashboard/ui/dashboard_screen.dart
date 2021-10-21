import 'package:flutter/material.dart';
import 'package:news_app/screens/dashboard/ui/trends_screen.dart';
import 'package:news_app/screens/document/ui/document_body/document_body.dart';
import 'package:news_app/screens/document/ui/document_table.dart';
import 'package:news_app/screens/sidebar/app_scaffold.dart';

import '../widgets/header_widget.dart';


class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State {
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppScaffold(
      key: key,
      body: ListView(
        shrinkWrap: true,
        children: [
          HeaderWidget(),
          SizedBox(
            height: 20,
          ),
          Trends()
        ],
      ),
    );
  }
}

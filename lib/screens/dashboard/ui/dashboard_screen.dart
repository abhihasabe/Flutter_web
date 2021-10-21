import 'package:flutter/material.dart';
import 'package:news_app/route/route.dart';
import 'package:news_app/screens/PreSales/ui/presale_screen.dart';
import 'package:news_app/screens/document/ui/document_body/document_body.dart';
import 'package:news_app/screens/document/ui/document_header.dart';
import 'package:news_app/screens/document/ui/document_table.dart';
import 'package:news_app/screens/sidebar/app_scaffold.dart';
import 'package:news_app/utils/connection.helper.dart';
import 'package:news_app/utils/dialog.helper.dart';
import 'package:news_app/widgets/button.dart';
import 'package:news_app/widgets/change_theme_button_widget.dart';
import 'package:news_app/widgets/snackbar.dart';
import 'package:news_app/route/route.dart' as route;
import 'package:news_app/widgets/toolbar.dart';

import 'dashboard_header.dart';


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
      pageTitle: "PMTC",
      body: Container(
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
      ),
    );
  }
}

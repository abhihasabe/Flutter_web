import 'package:flutter/material.dart';
import 'package:news_app/screens/sidebar/app_scaffold.dart';
import 'package:news_app/utils/connection.helper.dart';
import 'package:news_app/utils/dialog.helper.dart';
import 'package:news_app/widgets/button.dart';
import 'package:news_app/widgets/change_theme_button_widget.dart';
import 'package:news_app/widgets/snackbar.dart';
import 'package:news_app/widgets/toolbar.dart';

class Service extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Service();
  }
}

class _Service extends State {
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppScaffold(
      key: key,
      pageTitle: "PMTC",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text("App Data",
                  style: Theme.of(context).textTheme.bodyText1)),
          Center(
            child: ButtonWidget(
              label: "Go to Login Page ",
              onPress: () async {
                await ConnectionHelper?.hasConnection() == true
                    ? DialogHelper.launchURL("http://www.google.com")
                    : SnackbarWidget(key,
                    context: context,
                    error: true,
                    message: "Please check Internet Connection",
                    actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
              },
            ),
          )
        ],
      ),
    );
    /*Scaffold(
      key: key,
      appBar: ToolbarWidget(
          hideBackArrow: false,
          actions: [ChangeThemeButtonWidget()],
          logoWidget: false,
          title: "Flutter Structure"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text("App Data",
                  style: Theme.of(context).textTheme.bodyText1)),
          Center(
            child: ButtonWidget(
              label: "Go to Login Page ",
              onPress: () async {
                await ConnectionHelper?.hasConnection() == true
                    ? DialogHelper.launchURL("http://www.google.com")
                    : SnackbarWidget(key,
                        context: context,
                        error: true,
                        message: "Please check Internet Connection",
                        actionMessage: "OK", action: () {
                        print("ACTION CLICKED");
                      });
              },
            ),
          )
        ],
      ),
    );*/
  }
}

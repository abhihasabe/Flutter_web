import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogHelper {

  static Future<void> launchURL(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldn't launch URL";
    }
  }

  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child:CircularProgressIndicator(
              ),
            ),
          );
        });
  }

  static void dismissDialog(BuildContext context){
    Navigator?.of(context, rootNavigator: true).pop();
  }

  static Widget showSnackbars(String text) {
    return SnackBar(
      content: Text(
        '$text',
        style: TextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog

    });
  }
}
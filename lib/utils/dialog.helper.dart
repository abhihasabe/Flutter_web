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

  static Future showScaleAlertBox({
    BuildContext ?context,
    Widget ?yourWidget,
//    Widget icon,
     Widget ?title,
     Widget ?firstButton,
     Widget ?secondButton,
  }) {
    assert(context != null, "context is null!!");
    assert(yourWidget != null, "yourWidget is null!!");
    assert(firstButton != null, "button is null!!");
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.7),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                title: title,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//                    icon,
                    yourWidget!
                  ],
                ),
                actions: <Widget>[
                  firstButton!,
                  secondButton!,
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 250),
        barrierDismissible: false,
        barrierLabel: '',
        context: context!,
        pageBuilder: (context, animation1, animation2)
        {
          return yourWidget!;
        });
  }

}
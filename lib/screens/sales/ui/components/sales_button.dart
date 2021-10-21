import 'package:flutter/material.dart';

class SalesCustomButton extends StatelessWidget {
  final Function clickFunction;
  final String showText;
  final Color color;
  final Color textColor;

  const SalesCustomButton(
      {required Key key,
      required this.clickFunction,
      required this.showText,
      required this.color,
      required this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: textColor, fontSize: 16, letterSpacing: 1)),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: () => clickFunction,
      child: Container(
        height: 40,
        width: 180,
        alignment: Alignment.center,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(showText, style: TextStyle(color: textColor)),
        ]),
      ),
    );
  }
}

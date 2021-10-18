import 'package:flutter/material.dart';

class DocumentCustomButton extends StatelessWidget {
  final Function clickFunction;
  final String showText;
  final Color color;
  final Color textColor;

  const DocumentCustomButton(
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
            TextStyle(color: textColor, fontSize: 12, letterSpacing: 1)),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: () => clickFunction,
      child: Text(showText, style: TextStyle(color: textColor)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/theme/colors.dart' as colors;
import 'package:news_app/widgets/text.dart';

class ButtonWidget extends StatelessWidget {
  final String? label;
  final Function()? onPress;
  final bool? disabled;
  final bool? transparent;
  final IconData? icon;
  final bool? facebook;

  final double _elevation = 3;

  const ButtonWidget({
    Key? key,
    this.label,
    this.onPress,
    this.disabled,
    this.transparent,
    this.icon,
    this.facebook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var action = disabled == true ? null : onPress;

    Color? backgroundColor = Theme.of(context).buttonColor;
    Color? borderColor = Theme.of(context).textTheme.button?.color;
    Color? textColor = Theme.of(context).textTheme.button?.color;

    if (transparent == true) {
      backgroundColor = colors.backgroundColor;
      borderColor = colors.accentColor;
      textColor = colors.accentColor;
    } else {
      backgroundColor = colors.accentColor;
      borderColor = colors.accentColor;
      textColor = Colors.white;
    }

    if (facebook == true) {
      backgroundColor = colors.facebookColor;
      borderColor = colors.facebookColor;
      textColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              // background color
              primary: colors.buttonColor,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 45.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: _elevation),
          onPressed: action,
          child: TextWidget(
              text: label?.toUpperCase() ?? "Label",
              small: true,
              color: Colors.white)),
    );
  }
}

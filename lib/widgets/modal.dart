import 'package:flutter/material.dart';
import 'text.dart';

class ModalWidget {
  static Future show(BuildContext context,
          {IconData? icon,
          String? title,
          Widget? body,
          String? confirmLabel = "Button Label",
          Function? confirmOnPress,
          String? cancelLabel = "Button Label",
          Function? cancelOnPress}) =>
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => AlertDialog(
                title: icon == null
                    ? title == null
                        ? null
                        : TextWidget(text: title)
                    : Row(children: <Widget>[
                        Icon(icon),
                        SizedBox(width: 8.0),
                        TextWidget(text: title ?? "")
                      ]),
                content:
                    body != null ? SingleChildScrollView(child: body) : null,
                actions: <Widget>[
                  //CANCEL BUTTON
                  if (cancelLabel != null)
                    TextButton(
                        child: TextWidget(
                            text: cancelLabel, color: Colors.grey[400]),
                        onPressed: () {
                          if (cancelOnPress != null) cancelOnPress();
                          Navigator.pop(context);
                        }),

                  //CONFIRM BUTTONS
                  if (confirmLabel != null && cancelLabel == null)
                    TextButton(
                        child: TextWidget(text: confirmLabel, accent: true),
                        onPressed: () {
                          if (confirmOnPress != null) confirmOnPress();
                          Navigator.pop(context);
                        }),

                  if (cancelLabel != null)
                    TextButton(
                      child: TextWidget(text: confirmLabel, accent: true),
                      onPressed: () {
                        if (confirmOnPress != null) confirmOnPress();
                        Navigator.pop(context);
                      },
                    )
                ],
              ));
}

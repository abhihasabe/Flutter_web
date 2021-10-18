import 'package:flutter/material.dart';
import 'package:news_app/widgets/change_theme_button_widget.dart';
import 'package:news_app/widgets/toolbar.dart';

import 'app_drawer.dart';

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AppScaffold extends StatelessWidget {
  const AppScaffold({this.body, @required this.pageTitle, Key? key}) : super(key: key);

  final Widget ?body;

  final String ?pageTitle;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        if (!displayMobileLayout)
          const AppDrawer(
            permanentlyDisplay: true,
          ),
        Expanded(
          child: Scaffold(
            appBar: ToolbarWidget(
                hideBackArrow: false,
                actions: [ChangeThemeButtonWidget()],
                logoWidget: false,
                title: "$pageTitle"
            ),
            drawer: displayMobileLayout
                ? const AppDrawer(
                    permanentlyDisplay: false,
                  )
                : null,
            body: body,
          ),
        )
      ],
    );
  }
}

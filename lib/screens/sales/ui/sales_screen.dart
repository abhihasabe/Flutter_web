import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/sales/ui/components/sales_screen_mob_app_drawer.dart';
import 'package:news_app/screens/sidebar/app_drawer.dart';
import 'sales_main_screen.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> with TickerProviderStateMixin {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Theme(
        data: ThemeData(),
        child: Scaffold(
            body: size.width > 640
                ? SafeArea(
                    child: Row(
                    children: [
                      MediaQuery.of(context).size.width > 1100
                          ? AppDrawer(permanentlyDisplay: size.width > 640)
                          : SizedBox.shrink(),
                      Expanded(flex: 5, child: SalesMainScreen())
                    ],
                  ))
                : SalesScreenMobAppDrawer()),
      ),
    );
  }
}

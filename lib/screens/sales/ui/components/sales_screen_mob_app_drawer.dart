import 'package:flutter/material.dart';
import 'package:news_app/screens/sales/ui/sales_main_screen.dart';
import 'package:news_app/screens/sidebar/app_drawer.dart';

class SalesScreenMobAppDrawer extends StatefulWidget {
  const SalesScreenMobAppDrawer({Key? key}) : super(key: key);

  @override
  _SalesScreenMobAppDrawerState createState() =>
      _SalesScreenMobAppDrawerState();
}

class _SalesScreenMobAppDrawerState extends State<SalesScreenMobAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: AppDrawer(
          permanentlyDisplay: false,
        ),
        appBar: AppBar(
          // title: Text('screen'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Order"),
              Tab(text: "Sales Declaration"),
              Tab(text: "Sales Promotion")
            ],
          ),
        ),
        body: Theme(
          data: ThemeData(),
          child: TabBarView(
            children: [
              SalesMainScreen(),
              SalesMainScreen(),
              SalesMainScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

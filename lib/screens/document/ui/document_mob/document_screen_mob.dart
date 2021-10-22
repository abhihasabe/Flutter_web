import 'package:flutter/material.dart';
import 'package:news_app/screens/sidebar/app_drawer.dart';

import 'document_all_mob.dart';

class DocumentScreenMob extends StatefulWidget {
  const DocumentScreenMob({Key? key}) : super(key: key);

  @override
  _DocumentScreenMobState createState() => _DocumentScreenMobState();
}

class _DocumentScreenMobState extends State<DocumentScreenMob> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: AppDrawer(
          permanentlyDisplay: false,
        ),
        appBar: AppBar(
          // title: Text('screen'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "All"),
              Tab(text: "Marketing"),
              Tab(text: "Technical"),
              Tab(text: "Policy"),
              Tab(text: "Product"),
            ],
          ),
        ),
        body: Theme(
          data: ThemeData(),
          child: TabBarView(
            children: [
              DocumentAllMob(),
              Container(child: Text('Marketing')),
              Container(child: Text('Technical')),
              Container(child: Text('Policy')),
              Container(child: Text('Product')),
            ],
          ),
        ),
      ),
    );
  }
}

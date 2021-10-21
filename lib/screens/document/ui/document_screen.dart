import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/screens/document/document_mob/document_screen_mob.dart';
import 'package:news_app/screens/sidebar/app_drawer.dart';

import 'document_main_screen.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  _DocumentScreenState createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    log('${size.width}');
    return Scaffold(
        body: size.width > 640
            ? SafeArea(
                child: Row(
                children: [
                  MediaQuery.of(context).size.width > 1100 ? AppDrawer(permanentlyDisplay: size.width > 640) : SizedBox.shrink(),
                  Expanded(flex: 5, child: DocumentMainScreen())
                ],
              ))
            : DocumentScreenMob());
  }
}

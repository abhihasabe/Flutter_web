import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/screens/document/document_mob/document_screen_mob.dart';

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
    return Theme(
      data: ThemeData(),
      child: Scaffold(
          body: size.width > 640
              ? SafeArea(
                  child: Row(
                  children: [
                    MediaQuery.of(context).size.width > 1100
                        ? Expanded(
                            flex: 1,
                            child: Drawer(
                              child: Container(
                                color: Colors.black,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Text(
                                          'Dashboard',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    Expanded(flex: 5, child: DocumentMainScreen())
                  ],
                ))
              : DocumentScreenMob()),
    );
  }
}

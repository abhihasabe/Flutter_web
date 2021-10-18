import 'package:flutter/material.dart';

import 'document_main_screen.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  _DocumentScreenState createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(),
        child: SafeArea(
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
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Expanded(flex: 5, child: DashboardMainScreen())
            ],
          ),
        ),
      ),
    );
  }
}

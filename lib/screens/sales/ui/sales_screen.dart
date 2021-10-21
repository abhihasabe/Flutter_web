import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'sales_main_screen.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(),
        child: SafeArea(
          child: Row(
            children: [
              MediaQuery.of(context).size.width > 768
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
              Expanded(flex: 5, child: SalesMainScreen())
            ],
          ),
        ),
      ),
    );
  }
}

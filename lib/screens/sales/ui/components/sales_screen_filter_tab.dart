import 'dart:developer';
import 'package:flutter/material.dart';

class SalesScreenFilterTab extends StatefulWidget {
  const SalesScreenFilterTab({Key? key}) : super(key: key);

  @override
  _SalesScreenFilterTabState createState() => _SalesScreenFilterTabState();
}

int selected_index = 0;
late Size size;
late List<String> tabs;

class _SalesScreenFilterTabState extends State<SalesScreenFilterTab> {
  int selected_index = 0;
  late Size size;
  late List<String> tabs;
  Widget headerTab(String tabName, int index) {
    return GestureDetector(
      onTap: () {
        selected_index = index;
        setState(() {});
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              width: size.width / 30,
            ),
            SizedBox(
              width: (size.width / 50) / 2,
            ),
            Text(
              tabName,
              style: TextStyle(
                fontSize: 16,
                color: index == selected_index ? Colors.grey : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    tabs = ['Pending', 'Completed', 'Cancelled'];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ...tabs.map((e) => headerTab(e, tabs.indexOf(e))).toList(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

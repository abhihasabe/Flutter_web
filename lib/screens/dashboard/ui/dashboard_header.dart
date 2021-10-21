import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'document_user_card.dart';

class DashboardScreenHeader extends StatefulWidget {
  const DashboardScreenHeader({Key? key}) : super(key: key);

  @override
  _DashboardScreenHeaderState createState() => _DashboardScreenHeaderState();
}

class _DashboardScreenHeaderState extends State<DashboardScreenHeader> {
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
            SizedBox(width: size.width / 25),
            index == selected_index
                ? Container(height: 10, width: 10, decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle))
                : SizedBox.shrink(),
            SizedBox(width: (size.width / 50) / 2),
            Text(tabName, style: TextStyle(color: index == selected_index ? Colors.blue : Colors.black))
          ],
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    tabs = ['Dashboard'];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 10,
          ),
          ...tabs.map((e) => headerTab(e, tabs.indexOf(e))).toList(),
          DashboardCard(),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

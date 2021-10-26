import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/screens/document/ui/components/document_user_card.dart';
import 'sales_order_card.dart';

class SalesScreenHeader extends StatefulWidget {
  const SalesScreenHeader({Key? key}) : super(key: key);

  @override
  _SalesScreenHeaderState createState() => _SalesScreenHeaderState();
}

class _SalesScreenHeaderState extends State<SalesScreenHeader> {
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
        height: 60,
        child: Row(
          children: [
            SizedBox(
              width: size.width / 25,
            ),
            index == selected_index
                ? Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  )
                : SizedBox.shrink(),
            SizedBox(
              width: (size.width / 50) / 3,
            ),
            Text(
              tabName,
              style: TextStyle(
                fontSize: 18,
                color: index == selected_index ? Colors.blue : Colors.black,
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
    tabs = ['Order', 'Sales Declaration', 'Sales Promotion'];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ...tabs.map((e) => headerTab(e, tabs.indexOf(e))).toList(),
          // Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
          ),
          DocumentUserCard(),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

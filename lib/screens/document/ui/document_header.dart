import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/document_user_card.dart';

class DocumentScreenHeader extends StatefulWidget {
  const DocumentScreenHeader({Key? key}) : super(key: key);

  @override
  _DocumentScreenHeaderState createState() => _DocumentScreenHeaderState();
}

class _DocumentScreenHeaderState extends State<DocumentScreenHeader> {

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
              width: (size.width / 50) / 2,
            ),
            Text(
              tabName,
              style: TextStyle(
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
    tabs = ['All', 'Marketing', 'Technical', 'Policy', 'Product'];
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

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/utils/date_picker.dart';
import 'package:news_app/screens/document/ui/components/document_auto_completer_widget.dart';
import 'package:news_app/screens/document/ui/components/document_button.dart';
import 'package:news_app/screens/document/ui/components/document_dropdown_widget.dart';
import 'package:webfeed/domain/media/media.dart';

class DocumentScreenSubHeader extends StatefulWidget {
  const DocumentScreenSubHeader({Key? key}) : super(key: key);

  @override
  _DocumentScreenSubHeaderState createState() =>
      _DocumentScreenSubHeaderState();
}

class _DocumentScreenSubHeaderState extends State<DocumentScreenSubHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DocumentDatePicker(
              lable: 'From',
            ),
            DocumentDatePicker(
              lable: 'To',
            ),
            DocumentCustomeDropDown(
              lableText: 'Category',
              selectedValue: '3-Wheeler',
              savetext: (value) {
                log(value);
              },
              listValue: ['value1', 'value2'],
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 6) / 3,
            ),
            Container(
                height: 50,
                padding: EdgeInsets.only(top: 5, left: 10),
                alignment: Alignment.center,
                width: 200,
                child: DashboardAutoComplete(hintName:"Global Search")),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 6) / 2,
            ),
            DocumentCustomButton(
              clickFunction: () {},
              color: Colors.grey,
              showText: 'Reset',
              textColor: Colors.black,
              key: ValueKey('reset'),
            ),
            SizedBox(
              width: 20,
            ),
            DocumentCustomButton(
              clickFunction: () {},
              color: Colors.blue,
              showText: 'Apply',
              textColor: Colors.white,
              key: ValueKey('Apply'),
            )
          ],
        ),
      ),
    );
  }
}

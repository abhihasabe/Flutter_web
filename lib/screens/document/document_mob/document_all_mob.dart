import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/screens/document/ui/components/document_auto_completer_widget.dart';
import 'package:news_app/screens/document/ui/components/document_button.dart';
import 'package:news_app/screens/document/ui/components/document_dropdown_widget.dart';
import 'package:news_app/screens/document/ui/document_table.dart';
import 'package:news_app/utils/date_picker.dart';

class DocumentAllMob extends StatefulWidget {
  const DocumentAllMob({Key? key}) : super(key: key);

  @override
  _DocumentAllMobState createState() => _DocumentAllMobState();
}

class _DocumentAllMobState extends State<DocumentAllMob> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DocumentDatePicker(
                lable: 'From',
              ),
              DocumentDatePicker(
                lable: 'To',
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DocumentCustomeDropDown(
                lableText: 'Category',
                selectedValue: '3-Wheeler',
                savetext: (value) {
                  log(value);
                },
                listValue: ['value1', 'value2'],
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.only(top: 5, left: 10),
                  alignment: Alignment.center,
                  width: 200,
                  child: DashboardAutoComplete(hintName:"Global Search")),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          DocumentTableScreen(),
        ],
      ),
    );
  }
}

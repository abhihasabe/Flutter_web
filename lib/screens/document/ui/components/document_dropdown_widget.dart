import 'dart:developer';

import 'package:flutter/material.dart';

class DocumentCustomeDropDown extends StatefulWidget {
  final String selectedValue;
  final List<String> listValue;
  final String lableText;
  final Function savetext;
  DocumentCustomeDropDown(
      {required this.selectedValue,
      required this.listValue,
      required this.lableText,
      required this.savetext});
  @override
  _DocumentCustomeDropDownState createState() =>
      _DocumentCustomeDropDownState(selectedValue, listValue);
}

class _DocumentCustomeDropDownState extends State<DocumentCustomeDropDown> {
  String selectedValue;
  final List<String> listValue;
  _DocumentCustomeDropDownState(this.selectedValue, this.listValue);
  @override
  void initState() {
    listValue.insert(0, selectedValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 5),
      height: 60,
      width: 100,
      child: Theme(
        data: ThemeData(
            buttonTheme: ButtonThemeData(buttonColor: Colors.white),
            hoverColor: Colors.white),
        child: DropdownButtonFormField(
          value: selectedValue,

          // selectedItemBuilder: (BuildContext context) {
          //   return listValue
          //       .map<Widget>(
          //         (String item) => Text(
          //           item,
          //           style: TextStyle(fontSize: 12),
          //         ),
          //       )
          //       .toList();
          // },
          items: listValue
              .map((val) => DropdownMenuItem<String>(
                  value: val,
                  child: Text(
                    val,
                    style: TextStyle(fontSize: 14),
                  )))
              .toList(),
          onChanged: (value) {
            selectedValue = value.toString();
            log(selectedValue);
            setState(() {});
          },
          decoration: InputDecoration(
              labelText: widget.lableText, hoverColor: Colors.white),
          onSaved: (value) => widget.savetext,
        ),
      ),
    );
  }
}

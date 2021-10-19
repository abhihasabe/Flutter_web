import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DocumentDatePicker extends StatefulWidget {
  final String lable;
  const DocumentDatePicker({Key? key, required this.lable}) : super(key: key);

  @override
  _DocumentDatePickerState createState() => _DocumentDatePickerState();
}

class _DocumentDatePickerState extends State<DocumentDatePicker> {
  final dateController = TextEditingController();
  late String value;

  @override
  void initState() {
    dateController.text = DateFormat("dd MMM yyyy").format(DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        readOnly: true,
        controller: dateController,
        decoration: InputDecoration(
          labelText: widget.lable,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
          // labelText: TextStyle(),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          // contentPadding: EdgeInsets.only(top: 5, left: 10, bottom: 35),
          // labelText: "From Date",

          // filled: true,
          suffixIcon: Icon(
            Icons.calendar_today,
            color: Colors.grey,
            size: 14,
          ),
          // hintText: "date"
        ),
        onTap: () async {
          var date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.blue,
                      primaryColorDark: Colors.teal,
                      accentColor: Colors.teal,
                    ),
                    dialogBackgroundColor: Colors.white,
                  ),
                  child: child != null ? child : Container(),
                );
              });
          if (date != null) {
            dateController.text = DateFormat('dd MMM yyyy').format(date);
          }
        },
      ),
    );
  }
}

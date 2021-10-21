import 'package:flutter/material.dart';
import 'document_body/document_body.dart';
import 'document_header.dart';
import 'document_table.dart';

class DocumentMainScreen extends StatefulWidget {
  const DocumentMainScreen({Key? key}) : super(key: key);

  @override
  _DocumentMainScreenState createState() => _DocumentMainScreenState();
}

class _DocumentMainScreenState extends State<DocumentMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: ScrollController(),
        shrinkWrap: true,
        children: [
          DocumentScreenHeader(),
          DocumentScreenSubHeader(),
          SizedBox(
            height: 20,
          ),
          DocumentTableScreen()
        ],
      ),
    );
  }
}

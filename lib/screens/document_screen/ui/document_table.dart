import 'package:flutter/material.dart';

class DocumentTableScreen extends StatefulWidget {
  const DocumentTableScreen({Key? key}) : super(key: key);

  @override
  _DocumentTableScreenState createState() => _DocumentTableScreenState();
}

class _DocumentTableScreenState extends State<DocumentTableScreen> {
  DataTableSource _data = _TableData();
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(columns: [
      DataColumn(label: Text('DocumentId')),
      DataColumn(label: Text('Subject')),
      DataColumn(label: Text('Category')),
      DataColumn(label: Text('Published')),
      DataColumn(label: Text('View'))
    ], source: _data);
  }
}

class _TableData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      20,
      (index) => {
            'document_id': index,
            'subject': 'The Price shown on',
            'category': 'Product Improvement',
            'published': '20 July 2021'
          });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['document_id'].toString())),
      DataCell(Text(_data[index]['subject'])),
      DataCell(Text(_data[index]['category'])),
      DataCell(Text(_data[index]['published'])),
      DataCell(Icon(Icons.remove_red_eye))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

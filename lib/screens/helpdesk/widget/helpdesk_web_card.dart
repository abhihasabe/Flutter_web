import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ParseJSON {
  String? ticket_id;
  String? ageing;
  String? subject;
  String? description;
  String? modified_date;
  String? pending_on;
  String? created;

  ParseJSON(
      {this.ticket_id,
        this.ageing,
        this.subject,
        this.description,
        this.modified_date,
        this.pending_on,
        this.created});

  factory ParseJSON.fromJson(Map<String, dynamic> json) {
    return ParseJSON(
        ticket_id: json['ticket_id'],
        ageing: json['ageing'],
        subject: json['subject'],
        description: json['description'],
        modified_date: json['modified_date'],
        pending_on: json['pending_on'],
        created: json['created']);
  }
}


class hdWebCard extends StatefulWidget {
  const hdWebCard({Key? key}) : super(key: key);

  @override
  _hdWebCardState createState() => _hdWebCardState();
}

class _hdWebCardState extends State<hdWebCard> with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<dynamic>? animation;

  final String apiURL = 'https://api.npoint.io/da3af968d3a7deb18f12';
  Future<List<ParseJSON>> fetchJSON() async {
    var jsonResponse = await http.get(Uri.parse(apiURL));

    if (jsonResponse.statusCode == 200) {
      final jsonItems =
      json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

      List<ParseJSON> tempList = jsonItems.map<ParseJSON>((json) {
        return ParseJSON.fromJson(json);
      }).toList();

      return tempList;
    } else {
      throw Exception('Failed To Load Data');
    }
  }


  void initState() {
    print('initState');
    setState(() {
      print('SetState');
    });
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
//    getHotEnqDetails('', pageIndex);
  }

  @override
  dispose() {
    animationController!.dispose(); // you need this
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ParseJSON>>(
        future: fetchJSON(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ParseJSON>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Column(
                        children: [
                          const Text("Aging", style: TextStyle(fontSize: 10.0)),
                          Text(items[index].ageing.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 21.0,
                              )),
                        ],
                      ),
                      title: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              items[index].ticket_id.toString(),
                            ),
                            Expanded(
                              child: Text(
                                items[index].subject.toString(),
                              ),
                            ),
                            const Text("Modified : "),
                            Text(items[index].modified_date.toString()),
                          ],
                        ),
                        const Divider(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Created : "),
                            Text(
                              items[index].created.toString(),
                            ),
                            Expanded(
                              child: Text(items[index].description.toString()),
                            ),
                            Text(items[index].pending_on.toString())
                          ],
                        ),
                      ]),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

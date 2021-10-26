import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/colors.dart';

class WebCard extends StatefulWidget {
  const WebCard({Key? key}) : super(key: key);
  @override
  _WebCardState createState() => _WebCardState();
}

class _WebCardState extends State<WebCard> with TickerProviderStateMixin {
  late List<Map<String, dynamic>> order_list;

  @override
  AnimationController? animationController;
  Animation<dynamic>? animation;

  void initState() {
    print('initState');
    setState(() {
      print('SetState');
    });
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        // scrollDirection: !displayMobileLayout!?Axis.horizontal:Axis.vertical,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: _statisticsListBuilder,
      ),
    );
  }

  Widget _statisticsListBuilder(BuildContext context, int index) {
    order_list = [
      {
        'orderNo': '406-9338089-364435555',
        'OrderPlaced': '10 Aug 2021',
        'status': 'Status',
        'TotalItems': 11,
        'Total': '\$10.299'
      },
      {
        'orderNo': '406-9338089-364435556',
        'OrderPlaced': '10 Aug 2021',
        'status': 'Order Delivered',
        'date': '12 Aug 2021',
        'TotalItems': 11,
        'Total': '\$10.299'
      },
      {
        'orderNo': '406-9338089-364435557',
        'OrderPlaced': '10 Aug 2021',
        'status': 'Order Cancelled',
        'date': '14 Aug 2021',
        'TotalItems': 11,
        'Total': '\$10.299',
        'reason':
            'Expected Delivery Date Has Changed And The Product Is Arriving At A Later Date'
      }
    ];
    return Card(
      margin:
          const EdgeInsets.only(left: 60.0, right: 20.0, top: 5.0, bottom: 5.0),
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 4),
                        child: Text(
                          'Order No',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 4),
                        child: Text(
                          "ORDER PLACED",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 4),
                        child: Text(
                          "${order_list[index]['status']}",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 4),
                        child: Text(
                          'Total Items',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 4),
                        child: Text(
                          'TOTAL',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 4),
                          child: Text(
                            "${order_list[index]['orderNo']}",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 4),
                          child: Text(
                            "${order_list[index]['OrderPlaced']}",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 4),
                          child: Text(
                            order_list[index]['date'] ?? "Order Placed",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 4),
                          child: Text(
                            "${order_list[index]['TotalItems']}",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 4),
                          child: Text(
                            "${order_list[index]['Total']}",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 0.0, top: 4),
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.blue,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (order_list[index]['reason'] != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0, top: 2),
                              child: Text(
                                'Cancellation Reason',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0, top: 2),
                              child: Text(
                                "${order_list[index]['reason']}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

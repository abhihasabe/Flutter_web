import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobCard extends StatefulWidget {
  const MobCard({Key? key}) : super(key: key);

  @override
  _MobCardState createState() => _MobCardState();
}

class _MobCardState extends State<MobCard> with TickerProviderStateMixin {
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

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 4),
                        child: Text(
                          "Order No:" + ' 406-9338089-364435555',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, top: 4),
                      child: Text(
                        'Status: ' + ' Order Placed',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 0),
                          child: Text(
                            'Total Items: ' + ' 11',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, top: 4),
                      child: Text(
                        'Total: ' + ' \$10.299',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 0),
                          child: Text(
                            'ORDER PLACED: ' + ' 10 Aug 2021',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

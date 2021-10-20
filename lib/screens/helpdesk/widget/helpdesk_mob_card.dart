import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hdMobCard extends StatefulWidget {
  const hdMobCard({Key? key}) : super(key: key);

  @override
  _hdMobCardState createState() => _hdMobCardState();
}

class _hdMobCardState extends State<hdMobCard> with TickerProviderStateMixin {
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
//    getHotEnqDetails('', pageIndex);
  }

  @override
  dispose() {
    animationController!.dispose(); // you need this
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                          "DTHJ3859889",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
//                                                          fontWeight: FontWeight.w600,
                              fontSize: 16),
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
                              'Modified: Today 1:52 PM',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 3),
                    child: Text(
                      'Promotion not applied on last order',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                        //  fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 4),
                        child: Text(
                          "Created: Sept11,2021",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey,
//                                                          fontWeight: FontWeight.w600,
                              fontSize: 14),
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
                              'Pending on: John Ocen',
                              textAlign: TextAlign.left,
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

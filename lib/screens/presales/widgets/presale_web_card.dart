import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/colors.dart';

class WebCard extends StatefulWidget {
  const WebCard({Key? key}) : super(key: key);

  @override
  _WebCardState createState() => _WebCardState();

}

class _WebCardState extends State<WebCard> with TickerProviderStateMixin{
  @override
  AnimationController ?animationController;
  Animation<dynamic> ?animation;

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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: <Widget>[
            Row(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 0.0, top: 4),
                        child: Text(
                          'ENQ003',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:240.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 0.0, top: 4),
                        child: Text(
                          'NEW PEUGEOT METROPOLOCE GT',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(
                        top: 3.0),
                    child: Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets
                              .only(
                              left: 0.0,
                              top: 0),
                          child: Text(
                            'Today 1:52 PM',
                            textAlign:
                            TextAlign.left,
                            style: TextStyle(
                                color:
                                Colors.black,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 4.0, top: 4),
                        child: Text(
                          'Buffer Zone, Paris',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:190.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 0.0, top: 4),
                          child: Text(
                            'Social > Facebook',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(
                          top: 3.0),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.end,
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 40,
                            decoration: new BoxDecoration(
                                color: fentRed,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(40.0),
                                  topRight: const Radius.circular(40.0),
                                  bottomLeft: const Radius.circular(40.0),
                                  bottomRight: const Radius.circular(40.0),
                                )
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'HOT',
                                  textAlign:
                                  TextAlign.left,
                                  style: TextStyle(
                                      color:
                                      Colors.white,
                                      fontSize: 9),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:4.0),
              child: new Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
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
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.person_outline,color: Colors.black,size: 15,),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 0.0, top: 2),
                        child: Text(
                          'JOHN DEO',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:200.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.phone_android,color: Colors.black,size: 15,),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 0.0, top: 4),
                        child: Text(
                          '8605233456',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 50,
                      top: 3.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.forward_to_inbox,color: Colors.black,size: 15,),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets
                            .only(
                            left: 0.0,
                            top: 0),
                        child: Text(
                          'paxbat@gmail.com',
                          textAlign:
                          TextAlign.left,
                          style: TextStyle(
                              color:
                              Colors.grey,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 50,
                        top: 3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.remove_red_eye,color: Colors.blue,size: 15,),
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

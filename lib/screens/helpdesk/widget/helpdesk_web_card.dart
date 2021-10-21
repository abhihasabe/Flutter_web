import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/colors.dart';

class hdWebCard extends StatefulWidget {
  const hdWebCard({Key? key}) : super(key: key);

  @override
  _hdWebCardState createState() => _hdWebCardState();

}

class _hdWebCardState extends State<hdWebCard> with TickerProviderStateMixin{
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
        child: ListTile(
          leading: Column(
            children:[
              Text("Aging",
              style:TextStyle(color: Colors.black,
              fontSize: 13),
              ),
              Text("2",style: TextStyle(
                color: Colors.black,
                fontSize: 21
              ),
              ),
            ],
          ),
        title: Column(
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
                          'DTH354567',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13),
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
                          'Promotion not applied on last order',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.picture_as_pdf,color: Colors.red,size: 21,
                        ),
                      ],
                    )
                )
              ],
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
                  padding: const EdgeInsets.only(left:4.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 0.0, top: 4),
                        child: Text(
                          'Created: Today 1:52 PM',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:180.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 2.0, top: 4),
                        child: Text(
                          'Modified: Today 01:52 PM',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13),
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
                            'Pending On: Joe Ocean',
                            textAlign:
                            TextAlign.left,
                            style: TextStyle(
                                color:
                                Colors.black,
                                fontSize: 13),
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

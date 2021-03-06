import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/dimens.dart';

class MobCard extends StatefulWidget {
  const MobCard({Key? key}) : super(key: key);

  @override
  _MobCardState createState() => _MobCardState();

}

class _MobCardState extends State<MobCard> with TickerProviderStateMixin{
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
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 0.0, top: 4),
                        child: Text(
                          "ENQ0001",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
//                                                          fontWeight: FontWeight.w600,
                              fontSize:
                              fontTextSmall),
                        ),
                      ),
                    ],
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
                                  Colors.grey,
                                  fontSize: fontTextSmall),
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
                    padding: const EdgeInsets.only(
                        left: 0.0,top:3),
                    child: Text(
                      'John.Deo',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize:
                          fontTextSmall,
//                                                        fontWeight: FontWeight.w400,
                          color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 00.0, top: 4),
              child: Text(
                // 'Interested Model : ' +
                'NEW PEUGEOT',
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ),
            Row(
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 0.0, top: 4),
                //   child: Text(
                //     'Social : ',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //         color: Colors.grey,
                //         fontSize:
                //         14),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 3.0, top: 4),
                //   child: Text(
                //     "Facebook",
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       color: Colors.grey,
                //       fontSize: 14,
                //     ),
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 0.0, top: 4),
                        child: Text(
                          'paxbat@gmail.com',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              100),
                          border: Border.all(
                              width: 1,
                              color: Colors.grey)),
                      child: Icon(
                        Icons.call,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Padding(
                      padding:
                      const EdgeInsets.only(
                          left: 12),
                      child: Text(
                        '8650988765',
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow:
                        TextOverflow.ellipsis,
                        style: TextStyle(
                            decoration:
                            TextDecoration
                                .underline,
                            fontSize:
                            14,
//                                                        fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  /*Flexible(
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
                                                  enquiryList[i].place,
                                                  textAlign:
                                                      TextAlign.left,
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.grey,
                                                      fontSize: AppTheme
                                                          .FontMedium),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                          ),*/
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/colors.dart';

class hdticketwebdetails extends StatefulWidget {
  const hdticketwebdetails({Key? key}) : super(key: key);

  @override
  _hdticketwebdetailsState createState() => _hdticketwebdetailsState();

}

class _hdticketwebdetailsState extends State<hdticketwebdetails> with TickerProviderStateMixin{
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
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(
                        left: 0.0, top: 4),
                    child: Text(
                      'Follow up by',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 0.0, top: 4),
                        child: Text(
                          'Pravin Dor',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(
                          left: 0.0, top: 4),
                      child: Text(
                        'Follow up On',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 0.0, top: 4),
                          child: Text(
                            '20 July 2021',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(
                          left: 0.0, top: 4),
                      child: Text(
                        'Remarks/Comments',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 0.0, top: 4),
                          child: Text(
                            'Product Improvement',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12),
                          ),
                        ),
                      ],
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
              ),


            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: new Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}

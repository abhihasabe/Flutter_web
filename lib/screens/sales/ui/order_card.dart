import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/sales/widgets/sales_mob_card.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late AnimationController animationController;
  late Animation<double> topBarAnimation;

  final ScrollController scrollController = ScrollController();
  final TextEditingController roleController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.only(top: 8),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int i) {
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / 100) * i, 1.0,
                        curve: Curves.fastOutSlowIn)));
            animationController.forward();
            return AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? child) {
                  return FadeTransition(
                    opacity: animation,
                    child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, 50 * (1.0 - animation.value), 0.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 0),
                        child: InkWell(
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => test())));
                          // },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      MobCard(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}

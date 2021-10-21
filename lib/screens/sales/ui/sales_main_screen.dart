import 'package:flutter/material.dart';
import 'package:news_app/screens/sales/ui/components/sales_screen_subheader.dart';
import 'package:news_app/screens/sales/widgets/sales_mob_card.dart';
import 'package:news_app/screens/sales/widgets/sales_web_card.dart';
import 'sales_header.dart';

class SalesMainScreen extends StatefulWidget {
  const SalesMainScreen({Key? key}) : super(key: key);

  @override
  _SalesMainScreenState createState() => _SalesMainScreenState();
}

class _SalesMainScreenState extends State<SalesMainScreen> {
  late List<String> order_list;
  bool? displayMobileLayout;
  @override
  Widget build(BuildContext context) {
    displayMobileLayout = MediaQuery.of(context).size.width < 1000;
    return Container(
        child: !displayMobileLayout!
            ? ListView(
                controller: ScrollController(),
                shrinkWrap: true,
                children: [
                  SalesScreenHeader(),
                  SalesScreenSubHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  ...order_list.map((e) => WebCard()).toList(),
                  // !displayMobileLayout! ? WebCard() : MobCard(),
                ],
              )
            : ListView(
                controller: ScrollController(),
                shrinkWrap: true,
                children: [
                  SalesScreenHeader(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search, color: Colors.black),
                              ),
                              border: InputBorder.none,
                              filled: false,
                              hintText: 'Search Order',
                              contentPadding: const EdgeInsets.only(
                                left: 16,
                                right: 20,
                                top: 16,
                                bottom: 0,
                              ),
                            ),
                            onChanged: (String txt) {}),
                      ),
                    ),
                  ),
                  // SalesScreenSubHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  ...order_list.map((e) => MobCard()).toList(),
                ],
              ));
  }

  @override
  initState() {
    super.initState();
    order_list = ['1', '2', '3', '4', '5', '6', '1', '2', '3', '4', '5', '6'];
  }
}

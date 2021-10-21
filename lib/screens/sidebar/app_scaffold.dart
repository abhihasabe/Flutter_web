import 'package:flutter/material.dart';
import 'package:news_app/screens/document/ui/components/document_user_card.dart';
import 'app_drawer.dart';

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough

class AppScaffold extends StatefulWidget{

  const AppScaffold({@required this.body, @required this.pageTitle, Key? key}) : super(key: key);

  final Widget? body;

  final String? pageTitle;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppScaffold(body: body, pageTitle: pageTitle, key: key) ;
  }
}

class _AppScaffold extends State {


  _AppScaffold({@required this.body, @required this.pageTitle, Key? key});

  final Widget? body;

  final String? pageTitle;

  int selected_index = 0;
  late Size size;
  late List<String> tabs;
  Widget headerTab(String tabName, int index) {
    return GestureDetector(
      onTap: () {
        selected_index = index;
        setState(() {});
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              width: size.width / 25,
            ),
            index == selected_index
                ? Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
            )
                : SizedBox.shrink(),
            SizedBox(
              width: (size.width / 50) / 2,
            ),
            Text(
              tabName,
              style: TextStyle(
                color: index == selected_index ? Colors.blue : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    tabs = ['All', 'Marketing', 'Technical', 'Policy', 'Product'];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        if (!displayMobileLayout)
          const AppDrawer(permanentlyDisplay: true),
        Expanded(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.0),
              child: AppBar(
                elevation: 0,
                backgroundColor: Color(0xfff1f5fb),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  //...tabs.map((e) => headerTab(e, tabs.indexOf(e))).toList(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("   $pageTitle", style: TextStyle(fontSize: 16),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:28.0, top: 30, bottom: 20),
                    child: DocumentUserCard(),
                  ),
                ]),
                // when the app isn't displaying the mobile version of app, hide the menu button that is used to open the navigation drawer
                automaticallyImplyLeading: displayMobileLayout),
            ),
            drawer: displayMobileLayout ? const AppDrawer(permanentlyDisplay: false) : null,
            body: body,
          ),
        )
      ],
    );
  }
}

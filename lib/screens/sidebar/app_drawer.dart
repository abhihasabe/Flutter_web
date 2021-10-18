import 'package:flutter/material.dart';

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class AppDrawer extends StatefulWidget {
  const AppDrawer({@required this.permanentlyDisplay, Key? key})
      : super(key: key);

  final bool ? permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(leading: Icon(Icons.add),),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: Text("Dashboard"),
                    onTap: () async {
                      //await _navigateTo(context, RouteNames.home);
                    },
                    //selected: _selectedRoute == RouteNames.home,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: ListTile(
                    leading: const Icon(Icons.point_of_sale_sharp),
                    title: const Text("Pre- Sales"),
                    onTap: () async {
                      //await _navigateTo(context, RouteNames.gallery);
                    },
                    //selected: _selectedRoute == RouteNames.gallery,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: ListTile(
                    leading: const Icon(Icons.slideshow),
                    title: const Text("Sales"),
                    onTap: () async {
                      //await _navigateTo(context, RouteNames.slideshow);
                    },
                    //selected: _selectedRoute == RouteNames.slideshow,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text("Service"),
                    onTap: () async {
                      //await _navigateTo(context, RouteNames.settings);
                    },
                    //selected: _selectedRoute == RouteNames.settings,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: Text("Documents"),
                    onTap: () async {
                      //await _navigateTo(context, RouteNames.home);
                    },
                    //selected: _selectedRoute == RouteNames.home,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Help Desk"),
                    onTap: () async {
                      //await _navigateTo(context, RouteNames.gallery);
                    },
                    //selected: _selectedRoute == RouteNames.gallery,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: ListTile(
                    leading: const Icon(Icons.slideshow),
                    title: const Text("Reports"),
                    onTap: () async {
                      //await _navigateTo(context, RouteNames.slideshow);
                    },
                    //selected: _selectedRoute == RouteNames.slideshow,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text("Accounts"),
                    onTap: () async {
                      //await _navigateTo(context, RouteNames.settings);
                    },
                    //selected: _selectedRoute == RouteNames.settings,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

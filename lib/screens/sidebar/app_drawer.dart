import 'package:flutter/material.dart';
import 'package:news_app/route/route.dart' as route;

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class AppDrawer extends StatefulWidget {

  const AppDrawer({@required this.permanentlyDisplay, Key? key}) : super(key: key);

  final bool? permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String? _selectedRoute;

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Icon(Icons.circle, color: Colors.deepOrange, size: 89, ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text("Dashboard"),
                  onTap: () async {
                    await Navigator.pushNamed(context, route.homePage);
                  },
                  //selected: _selectedRoute == RouteNames.home,
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title:  Text("Pre Sales"),
                  onTap: () async {
                    await Navigator.pushNamed(context, route.preSalePage);
                  },
                  //selected: _selectedRoute == RouteNames.gallery,
                ),
                ListTile(
                  leading: const Icon(Icons.slideshow),
                  title: Text("Sales"),
                  onTap: () async {
                    await Navigator.pushNamed(context, route.salesPage);
                  },
                  //selected: _selectedRoute == RouteNames.slideshow,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text("Services"),
                  onTap: () async {
                    await Navigator.pushNamed(context, route.homePage);
                  },
                  //selected: _selectedRoute == RouteNames.settings,
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text("Documents"),
                  onTap: () async {
                    await Navigator.pushNamed(context, route.document);
                  },
                  //selected: _selectedRoute == RouteNames.home,
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title:  Text("Help Desk"),
                  onTap: () async {
                    await Navigator.pushNamed(context, route.homePage);
                  },
                  //selected: _selectedRoute == RouteNames.gallery,
                ),
                ListTile(
                  leading: const Icon(Icons.slideshow),
                  title: Text("Reports"),
                  onTap: () async {
                    await Navigator.pushNamed(context, route.homePage);
                  },
                  //selected: _selectedRoute == RouteNames.slideshow,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text("Accounts"),
                  onTap: () async {
                    await Navigator.pushNamed(context, route.homePage);
                  },
                  //selected: _selectedRoute == RouteNames.settings,
                ),
              ],
            ),
          ),
          if (widget.permanentlyDisplay!)
            const VerticalDivider(
              width: 1,
            )
        ],
      ),
    );
  }

  /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay!) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context)!.settings!.name;
    });
  }
}

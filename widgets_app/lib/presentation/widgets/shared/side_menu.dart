import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  void onDestinationTab(int value, BuildContext context) {
    setState(() {
      navDrawerIndex = value;
    });

    final menuItem = appMenuItems[value];
    widget.scaffoldKey.currentState?.closeDrawer();
    context.push(menuItem.url);
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final destinationWidgets = appMenuItems
        .map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon),
              label: Text(item.title),
            ))
        .toList();

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) => onDestinationTab(value, context),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Main'),
        ),
        ...destinationWidgets.sublist(0, 3),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More options'),
        ),
        ...destinationWidgets.sublist(3)
      ],
    );
  }
}

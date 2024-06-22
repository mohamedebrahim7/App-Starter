import 'package:flutter/material.dart';

import '../core/l10n/app_localizations.dart';
import 'page0.dart';
import 'page1.dart';
import 'page2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = <Widget>[
      Page0(),
      Page1(),
      Page2(),
    ];

    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homePage),
      ),
      body: IndexedStack(
        index: currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: l10n.explore,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: l10n.recipe,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: l10n.grocery,
          ),
        ],
      ),
    );
  }
}

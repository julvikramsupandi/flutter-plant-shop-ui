import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

enum TabItem { home, favorite, notification, account }

class MainPageState extends State<MainPage> {
  TabItem _currentItem = TabItem.home;
  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.favorite,
    TabItem.notification,
    TabItem.account
  ];

  void _onSelectTab(int index) {
    TabItem selectedTabItem = _bottomTabs[index];

    setState(() {
      _currentItem = selectedTabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _bottomTabs
                .map((tabItem) => _bottomNavigationBarItem(tabItem))
                .toList(),
            onTap: _onSelectTab,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
      body: SafeArea(
        child: _buildPage(),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(TabItem tabItem) {
    Color color = _currentItem == tabItem ? Colors.green : Colors.grey.shade400;

    IconData _icon(TabItem item) {
      switch (item) {
        case TabItem.home:
          return Icons.home_rounded;
        case TabItem.favorite:
          return Icons.favorite;
        case TabItem.notification:
          return Icons.notifications;
        case TabItem.account:
          return Icons.person;
        default:
          throw 'Unknown $item';
      }
    }

    return BottomNavigationBarItem(
      icon: Icon(
        _icon(tabItem),
        color: color,
        size: 30,
      ),
      label: '',
    );
  }

  Widget _buildPage() {
    switch (_currentItem) {
      case TabItem.home:
        return HomePage();
      case TabItem.favorite:
      // return; Favorite
      case TabItem.notification:
      // return; Notification
      case TabItem.account:
      // return; Account
      default:
        return HomePage();
    }
  }
}

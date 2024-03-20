import 'package:agrigate/pages/Homepage.dart';
import 'package:agrigate/pages/MarketPage.dart';
import 'package:agrigate/pages/SearchPage.dart';
import 'package:agrigate/pages/YouPage.dart';
import 'package:agrigate/pages/NewsPage.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbar createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  int _currentTabIndex = 0;

  int index = 0;

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Navigator.of(context).pushNamed("/home");
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed("/market");
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed("/search");
        break;

      case 3:
        Navigator.of(context).pushReplacementNamed("/news");
        break;

      case 4:
        Navigator.of(context).pushReplacementNamed("/you");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
      print(_currentTabIndex);
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => Homepage());
      case "/search":
        return MaterialPageRoute(builder: (context) => SearchPage());
      case "/market":
        return MaterialPageRoute(builder: (context) => MarketPage());
      case "/news":
        return MaterialPageRoute(builder: (context) => NewsPage());
      case "/you":
        return MaterialPageRoute(builder: (context) => YouPage());
      default:
        return MaterialPageRoute(builder: (context) => Homepage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      onTap: _onTap,
      currentIndex: _currentTabIndex,
      unselectedItemColor: Colors.blue,
      selectedItemColor: Colors.red,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Market",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: "News",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "You",
        ),
      ],
    );
  }
}

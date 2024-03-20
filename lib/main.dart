import 'package:agrigate/pages/SearchPage.dart';
import 'package:agrigate/pages/MarketPage.dart';
import 'package:agrigate/pages/YouPage.dart';
import 'package:agrigate/pages/Homepage.dart';
import 'package:agrigate/pages/NewsPage.dart';
import 'package:agrigate/pages/ArPage.dart';
//import 'package:agri/widgets/Appbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ArPage()));
          },
          label: const Text('AR Mode'),
          icon: Image.asset('assets/ar.jpg', height: 40, width: 40),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Market",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: "News",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "You",
        ),
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState?.pushNamed("/home");
        break;
      case 1:
        _navigatorKey.currentState?.pushNamed("/market");
        break;
      case 2:
        _navigatorKey.currentState?.pushNamed("/search");
        break;

      case 3:
        _navigatorKey.currentState?.pushNamed("/news");
        break;

      case 4:
        _navigatorKey.currentState?.pushNamed("/you");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/market":
        return MaterialPageRoute(builder: (context) => MarketPage());
      case "/search":
        return MaterialPageRoute(builder: (context) => SearchPage());
      case "/news":
        return MaterialPageRoute(builder: (context) => NewsPage());
      case "/you":
        return MaterialPageRoute(builder: (context) => YouPage());
      default:
        return MaterialPageRoute(
          builder: (context) => Homepage(),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:prototype2/pages/contact_page.dart';
import 'package:prototype2/pages/landing_page.dart';
import 'package:prototype2/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  int _currentPage = 0;

  final List<Widget> _pages = [
    LandingPage(),
    SearchPage(),
    ContactPage(),
    
  ];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages[_currentPage],
    );
  }
  

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (_index){
        setState(() {
          _currentPage = _index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.home_filled,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(
            Icons.search,
          ),
        ),
        BottomNavigationBarItem(
          label: 'connect',
          icon: Icon(
            Icons.call,
          ),
        ),
      ],
    );
  }
}

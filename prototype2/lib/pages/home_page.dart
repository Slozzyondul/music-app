import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _appTitle(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _appTitle() {
    return const Text(
      'Music App',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
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

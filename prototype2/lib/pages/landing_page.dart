import 'package:flutter/material.dart';
import 'package:prototype2/widgets/drawer_widget.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: _logoImageWidget(),
        title: Center(
          child: Text(
            'Music App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          buildPopupMenu(),
        ],
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //_appTitle(),
              _logoImageWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _appTitle() {
  //   return const Text(
  //     'Music App',
  //     style: TextStyle(
  //       color: Colors.white,
  //       fontSize: 25,
  //       fontWeight: FontWeight.w700,
  //     ),
  //   );
  // }

  Widget _logoImageWidget() {
    return SizedBox(
      height: _deviceHeight! * 0.15,
      width: _deviceWidth! *
          0.45, // Width is greater than height to create an oval
      child: ClipOval(
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

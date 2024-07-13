import 'package:flutter/material.dart';

class ClientProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientProfilePage();
  }
}

class _ClientProfilePage extends State<ClientProfilePage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

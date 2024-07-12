import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactPageState();
  }
}

class _ContactPageState extends State<ContactPage> {
  double? _deviceHeight, _deviceWidth;

  @override 
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
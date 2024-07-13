import 'package:flutter/material.dart';

class AllTutorsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllTutorsPage();
  }
}

class _AllTutorsPage extends State<AllTutorsPage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'Tutors',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
        ),
      ),
    );
  }
}

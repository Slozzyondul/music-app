import 'package:flutter/material.dart';

class AllInstrumentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllInstrumentsPage();
  }
}

class _AllInstrumentsPage extends State<AllInstrumentsPage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'Instruments',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
        ),
      ),
      backgroundColor: Colors.yellowAccent,
    );
  }
}

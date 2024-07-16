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
        backgroundColor: Colors.grey,
        title: Center(
          child: Text(
            'Music App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _instrumentsDescription(),
          _instrumentsGridView(),
        ],
      ),
    );
  }

  Widget _instrumentsDescription() {
    return SizedBox(
      height: _deviceHeight! * 0.1,
      width: _deviceWidth! * 1,
      child: Center(
        child: Text(
          "Instruments",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _instrumentsGridView() {
    List<Map<String, String>> instruments = [
      {'name': 'Drums', 'image': 'assets/images/drums.jpg'},
      {'name': 'flute', 'image': 'assets/images/flute.jpg'},
      {'name': 'guitar', 'image': 'assets/images/guitar.jpg'},
      {'name': 'piano', 'image': 'assets/images/keyboard.jpg'},
      {'name': 'violin', 'image': 'assets/images/violin.jpg'},

      // Add more instruments as needed
    ];

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemCount: instruments.length,
        itemBuilder: (BuildContext context, int index) {
          return _instrument1Container();
        },
      ),
    );
  }

  Widget _instrument1Container() {
    return Stack(
      children: [
        _drumImage(),
        _instrumentName(),
        _instrumentDetails(),
      ],
    );
  }

  Widget _drumImage() {
    return SizedBox(
      height: _deviceHeight! * 0.45,
      width: _deviceWidth! * 0.45,
      child: Image.asset(
        'assets/images/drums.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _instrumentName() {
    return Text(
      'Drums',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _instrumentDetails() {
    return Text('Instrument Details');
  }
}

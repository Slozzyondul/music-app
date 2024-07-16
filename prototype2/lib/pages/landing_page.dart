import 'package:flutter/material.dart';
import 'package:prototype2/pages/instruments_page.dart';
import 'package:prototype2/pages/tutors_page.dart';
import 'package:prototype2/widgets/drawer_widget.dart';
import 'package:prototype2/widgets/instrument_card_builder_widget.dart';
import 'package:prototype2/widgets/tutor_card_builder.dart';
import 'dart:async';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  double? _deviceHeight, _deviceWidth;
  ScrollController _scrollControllerInstruments = ScrollController();
  ScrollController _scrollControllerTutor = ScrollController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScrollInstruments();
    _startAutoScrollTutor();
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollControllerInstruments.dispose();
    _scrollControllerTutor.dispose();
    super.dispose();
  }

  void _startAutoScrollInstruments() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (_scrollControllerInstruments.hasClients) {
        if (_scrollControllerInstruments.position.pixels >=
            _scrollControllerInstruments.position.maxScrollExtent) {
          _scrollControllerInstruments.jumpTo(0); // Reset to start
        } else {
          _scrollControllerInstruments.animateTo(
            _scrollControllerInstruments.offset +
                1000.0, // Increase scroll amount
            duration: Duration(seconds: 30), // Adjust duration
            curve: Curves.linear,
          );
        }
      }
    });
  }

  void _startAutoScrollTutor() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (_scrollControllerTutor.hasClients) {
        if (_scrollControllerTutor.position.pixels >=
            _scrollControllerTutor.position.maxScrollExtent) {
          _scrollControllerTutor.jumpTo(0); // Reset to start
        } else {
          _scrollControllerTutor.animateTo(
            _scrollControllerTutor.offset + 1000.0, // Increase scroll amount
            duration: Duration(seconds: 20), // Adjust duration
            curve: Curves.linear,
          );
        }
      }
    });
  }

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
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          buildPopupMenu(context),
        ],
        backgroundColor: Colors.grey,
      ),
      //backgroundColor: Colors.brown,
      body: Column(
        children: [
          _appDescription(),
          _instrumentsDescription(),
          _instrumentScrollRow(),
          _tutorsDescription(),
          _tutorScrollRow(),
        ],
      ),
    );
  }

  Widget _appDescription() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: _deviceHeight! * 0.1,
        width: _deviceWidth! * 1,
        child: Text(
          "Welcome to our Music App, your ultimate companion for all things musical!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
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
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _instrumentScrollRow() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AllInstrumentsPage()),
        );
      },
      child: SizedBox(
        height: _deviceHeight! * 0.2,
        width: _deviceWidth! * 2,
        child: GestureDetector(
          child: ListView(
            controller: _scrollControllerInstruments,
            scrollDirection: Axis.horizontal,
            children: [
              buildInstrumentCard(
                context,
                'assets/images/guitar.jpg',
                'Guitar',
                'Guitar details here',
              ),
              buildInstrumentCard(context, 'assets/images/keyboard.jpg',
                  'Keyboard', 'Keyboard details here'),
              buildInstrumentCard(context, 'assets/images/violin.jpg', 'Violin',
                  'Violin details here'),
              buildInstrumentCard(context, 'assets/images/drums.jpg', 'Drums',
                  'Drum details here'),
              buildInstrumentCard(context, 'assets/images/flute.jpg', 'Flute',
                  'Flute details here'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tutorsDescription() {
    return SizedBox(
      height: _deviceHeight! * 0.1,
      width: _deviceWidth! * 1,
      child: Center(
        child: Text(
          "Tutors",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _tutorScrollRow() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AllTutorsPage()),
        );
      },
      child: SizedBox(
        height: _deviceHeight! * 0.2,
        width: _deviceWidth! * 1,
        child: GestureDetector(
          child: ListView(
            controller: _scrollControllerTutor,
            scrollDirection: Axis.horizontal,
            children: [
              buildTutorCard(
                context,
                'assets/images/tutor1.jpg',
                'Guitar tutor 1',
                'Guitar tutor details',
              ),
              buildTutorCard(
                context,
                'assets/images/tutor2.jpg',
                'Keyboard tutor1',
                'Keyboard tutor details here',
              ),
              buildTutorCard(
                context,
                'assets/images/tutor3.jpg',
                'Violin tutor 1',
                'Violin tutor details here',
              ),
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

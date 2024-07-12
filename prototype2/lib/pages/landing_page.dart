import 'package:flutter/material.dart';
import 'package:prototype2/widgets/drawer_widget.dart';
import 'package:prototype2/widgets/instrument_card_builder_widget.dart';
import 'package:prototype2/widgets/tutor_card_builder.dart';

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
    return SizedBox(
      height: _deviceHeight! * 0.2,
      width: _deviceWidth! * 1,
      child: GestureDetector(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            buildInstrumentCard(context, 'assets/images/guitar.jpg', 'Guitar',
                'Guitar details here', 'Read more...'),
            buildInstrumentCard(context, 'assets/images/keyboard.jpg',
                'Keyboard', 'Keyboard details here', 'Read more...'),
            buildInstrumentCard(context, 'assets/images/violin.jpg', 'Violin',
                'Violin details here', 'Read more...'),
            buildInstrumentCard(context, 'assets/images/drums.jpg', 'Drums',
                'Drum details here', 'Read more...'),
            buildInstrumentCard(context, 'assets/images/flute.jpg', 'Flute',
                'Flute details here', 'Read more...'),
          ],
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
    return SizedBox(
      height: _deviceHeight! * 0.2,
      width: _deviceWidth! * 1,
      child: GestureDetector(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {
                //Navigator.popAndPushNamed(context, 'contact');
              },
              child: buildTutorCard(
                context,
                'assets/images/tutor1.jpg',
                'Guitar tutor 1',
                'Guitar tutor details',
                'Read more...',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: buildTutorCard(
                context,
                'assets/images/tutor2.jpg',
                'Keyboard tutor1',
                'Keyboard tutor details here',
                'Read more...',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: buildTutorCard(
                context,
                'assets/images/tutor3.jpg',
                'Violin tutor 1',
                'Violin tutor details here',
                'Read more...',
              ),
            ),
          ],
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

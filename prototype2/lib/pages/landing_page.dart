import 'package:flutter/material.dart';
import 'package:prototype2/widgets/drawer_widget.dart';
import 'package:prototype2/widgets/instrument_card_widget.dart';

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
      backgroundColor: Colors.brown,
      body: Stack(
        children: [
          Positioned(
            left: 19,
            top: 19,
            child: SizedBox(
              height: _deviceHeight! * 0.8,
              width: _deviceWidth! * 0.8,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildInstrumentCard(
                    context,
                    'assets/images/juri-gianfrancesco-UCEtRnp8qR0-unsplash.jpg',
                    'Guitar',
                    'Guitar details here',
                    'A brief description of the guitar.',
                  ),
                  buildInstrumentCard(
                    context,
                    'assets/images/simeon-asenov-OuP41yLOi-E-unsplash.jpg',
                    'Keyboard',
                    'Keyboard details here',
                    'A brief description of the keyboard.',
                  ),
                  buildInstrumentCard(
                    context,
                    'assets/images/pexels-vitória-santos-2922301.jpg',
                    'Violin',
                    'Violin details here',
                    'A brief description of the violin.',
                  ),
                  buildInstrumentCard(
                    context,
                    'assets/images/pawel-szvmanski-i73F7ma3Q9k-unsplash.jpg',
                    'Drums',
                    'Drum details here',
                    'A brief description of the drums.',
                  ),
                ],
              ),
            ),
          ),
        ],
        //child: _logoImageWidget(),
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

import 'package:flutter/material.dart';
import 'package:prototype2/pages/bottom_navigation.dart';
import 'package:prototype2/pages/contact_page.dart';
import 'package:prototype2/pages/instruments_page.dart';
import 'package:prototype2/pages/search_page.dart';

void main()  async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'contact' : (context) => ContactPage(),
        'search' : (context) => SearchPage(),
        'instruments' : (context) => AllInstrumentsPage(),
      },
    );
  }
}

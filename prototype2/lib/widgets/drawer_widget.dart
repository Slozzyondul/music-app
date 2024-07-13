import 'package:flutter/material.dart';
import 'package:prototype2/pages/instruments_page.dart';
import 'package:prototype2/pages/tutors_page.dart';

Widget buildPopupMenu(BuildContext context) {
  return PopupMenuButton<String>(
    onSelected: (String value) {
      switch (value) {
        case 'Instruments':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AllInstrumentsPage()),
          );
          break;
         case 'Tutors':
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => AllTutorsPage()),
           );
           break;
        // case 'Settings':
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => SettingsPage()),
        //   );
        //   break;
      }
    },
    itemBuilder: (BuildContext context) {
      return {'Instruments', 'Tutors', 'Settings'}.map((String choice) {
        return PopupMenuItem<String>(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    },
  );
}

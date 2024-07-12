import 'package:flutter/material.dart';

Widget buildPopupMenu() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // Handle menu selection
        print(value);
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

  
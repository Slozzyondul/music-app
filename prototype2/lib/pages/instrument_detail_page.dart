import 'package:flutter/material.dart';

class InstrumentDetailPage extends StatelessWidget {
  final String name;
  final String imagePath;
  final String details;
  final List<String> tutors;

  InstrumentDetailPage({
    required this.name,
    required this.imagePath,
    required this.details,
    required this.tutors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              details,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Available Tutors:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tutors.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(tutors[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prototype2/pages/tutor_detail_page.dart';

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
          _tutorsDescription(),
          _tutorsGridView(),
        ],
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
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _tutorsGridView() {
    List<Map<String, String>> tutors = [
      {
        'name': 'Tutor 1',
        'image': 'assets/images/tutor1.jpg',
        'details': 'Experienced guitar tutor'
      },
      {
        'name': 'Tutor 2',
        'image': 'assets/images/tutor2.jpg',
        'details': 'Experienced piano tutor'
      },
      {
        'name': 'Tutor 3',
        'image': 'assets/images/tutor3.jpg',
        'details': 'Experienced violin tutor'
      },
      // Add more tutors as needed
    ];

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: tutors.length,
        itemBuilder: (BuildContext context, int index) {
          return _tutorContainer(
            tutors[index]['name']!,
            tutors[index]['image']!,
            tutors[index]['details']!,
          );
          // } else {
          //   return SizedBox
          //       .shrink(); // Return an empty widget if index is out of bounds
        },
      ),
    );
  }

  Widget _tutorContainer(
    String name,
    String imagePath,
    String details,
  ) {
    return GestureDetector(
      onTap: () {
        // Define the action on tap if needed
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TutorDetailPage(
              name: name,
              imagePath: imagePath,
              details: details,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            height: _deviceHeight! * 0.2,
            width: _deviceWidth! * 0.4,
            fit: BoxFit.cover,
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

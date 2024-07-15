import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:prototype2/widgets/profile_builder.dart';

class ClientProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientProfilePage();
  }
}

class _ClientProfilePage extends State<ClientProfilePage> {
  double? _deviceHeight, _deviceWidth;
  File? _profileImage;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      //backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _circleAvatar(),
            _profileInformataion(),
          ],
        ),
      ),
    );
  }

  void _postImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _profileImage = File(result.files.first.path!);
      });
    }
  }

  Widget _circleAvatar() {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: GestureDetector(
          onTap: () {
            _postImage();
          },
          child: CircleAvatar(
            radius: 30,
            backgroundImage:
                _profileImage != null ? FileImage(_profileImage!) : null,
            child: _profileImage == null
                ? Icon(
                    Icons.add_a_photo,
                    size: 30,
                    color: Colors.grey,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _profileInformataion() {
    return Column(
      children: [
        InfoRow(title: 'Name', info: 'Helena Hills'),
        InfoRow(title: 'Username', info: '@username'),
        InfoRow(title: 'Phone number', info: 'client phone number'),
        InfoRow(title: 'Email', info: 'name@domain.com'),
        InfoRow(title: 'Instruments', info: 'instruments instructor knows'),
        InfoRow(title: 'Location', info: 'where he is located'),
        InfoRow(title: 'Clients', info: 'current clients working with'),
        InfoRow(title: 'Rate', info: 'tutor charges per hour'),
        InfoRow(title: 'Availability', info: 'calendar free days'),
        InfoRow(
          title: 'Lessons',
          info: 'passed linked sample lessons',
        ),
        InfoRow(
          title: 'Bio',
          info:
              'A description of qualification, experience and reviews of the tutor',
          isBio: true,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ClientProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientProfilePage();
  }
}

class _ClientProfilePage extends State<ClientProfilePage> {
  double? _deviceHeight, _deviceWidth;
  File? _image;

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
      body: Column(
        children: [
          _circleAvatar(),
        ],
      ),
    );
  }

  void _postImage() async {
    FilePickerResult? _result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    File _image = File(_result!.files.first.path!);
  }

  Widget _circleAvatar() {
    return SizedBox(
      width: 100,
      height: 100,
      child: GestureDetector(
        onTap: () {
          _postImage();
        },
        child: CircleAvatar(
          radius: 30,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? Icon(
                  Icons.add_a_photo,
                  size: 50,
                  color: Colors.grey,
                )
              : null,
        ),
      ),
    );
  }
}

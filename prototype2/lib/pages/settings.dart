import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:prototype2/widgets/profile_builder.dart';

const String profileBoxName = 'profileBox';

class ClientProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientProfilePage();
  }
}

class _ClientProfilePage extends State<ClientProfilePage> {
  double? _deviceHeight, _deviceWidth;
  File? _profileImage;
  Box? profileBox;

  String name = 'Helena Hills';
  String username = '@username';
  String phoneNumber = 'client phone number';
  String email = 'name@domain.com';
  String instruments = 'instruments instructor knows';
  String location = 'where he is located';
  String clients = 'current clients working with';
  String rate = 'tutor charges per hour';
  String availability = 'calendar free days';
  String bio =
      'A description of qualification, experience and reviews of the tutor';

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  void _openBox() async {
    profileBox = await Hive.openBox(profileBoxName);
    _loadProfile();
  }

  void _loadProfile() {
    setState(() {
      name = profileBox?.get('name', defaultValue: name) ?? name;
      username =
          profileBox?.get('username', defaultValue: username) ?? username;
      phoneNumber = profileBox?.get('phoneNumber', defaultValue: phoneNumber) ??
          phoneNumber;
      email = profileBox?.get('email', defaultValue: email) ?? email;
      instruments = profileBox?.get('instruments', defaultValue: instruments) ??
          instruments;
      location =
          profileBox?.get('location', defaultValue: location) ?? location;
      clients = profileBox?.get('clients', defaultValue: clients) ?? clients;
      rate = profileBox?.get('rate', defaultValue: rate) ?? rate;
      availability =
          profileBox?.get('availability', defaultValue: availability) ??
              availability;
      bio = profileBox?.get('bio', defaultValue: bio) ?? bio;
    });
  }

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
            _profileInformation(),
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

  void _updateProfile(String key, String value) {
    profileBox?.put(key, value);
    setState(() {
      switch (key) {
        case 'name':
          name = value;
          break;
        case 'username':
          username = value;
          break;
        case 'phoneNumber':
          phoneNumber = value;
          break;
        case 'email':
          email = value;
          break;
        case 'instruments':
          instruments = value;
          break;
        case 'location':
          location = value;
          break;
        case 'clients':
          clients = value;
          break;
        case 'rate':
          rate = value;
          break;
        case 'availability':
          availability = value;
          break;
        case 'bio':
          bio = value;
          break;
      }
    });
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

  Widget _profileInformation() {
    return Column(
      children: [
        InfoRow(
            title: 'Name',
            info: name,
            onTap: () => _editField('Name', name, (value) {
                  _updateProfile('name', value);
                  setState(() => name = value);
                })),
        InfoRow(
            title: 'Username',
            info: username,
            onTap: () => _editField('Username', username, (value) {
                  _updateProfile('username', value);
                  setState(() => username = value);
                })),
        InfoRow(
            title: 'Phone number',
            info: phoneNumber,
            onTap: () => _editField('Phone number', phoneNumber, (value) {
                  _updateProfile('phoneNumber', value);
                  setState(() => phoneNumber = value);
                })),
        InfoRow(
            title: 'Email',
            info: email,
            onTap: () => _editField('Email', email, (value) {
                  _updateProfile('email', value);
                  setState(() => email = value);
                })),
        InfoRow(
            title: 'Instruments',
            info: instruments,
            onTap: () => _editField('Instruments', instruments, (value) {
                  _updateProfile('instruments', value);
                  setState(() => instruments = value);
                })),
        InfoRow(
            title: 'Location',
            info: location,
            onTap: () => _editField('Location', location, (value) {
                  _updateProfile('location', value);
                  setState(() => location = value);
                })),
        InfoRow(
            title: 'Clients',
            info: clients,
            onTap: () => _editField('Clients', clients, (value) {
                  _updateProfile('clients', value);
                  setState(() => clients = value);
                })),
        InfoRow(
            title: 'Rate',
            info: rate,
            onTap: () => _editField('Rate', rate, (value) {
                  _updateProfile('rate', value);
                  setState(() => rate = value);
                })),
        InfoRow(
            title: 'Availability',
            info: availability,
            onTap: () => _editField('Availability', availability, (value) {
                  _updateProfile('availability', value);
                  setState(() => availability = value);
                })),
        InfoRow(
            title: 'Bio',
            info: bio,
            isBio: true,
            onTap: () => _editField('Bio', bio, (value) {
                  _updateProfile('bio', value);
                  setState(() => bio = value);
                })),
      ],
    );
  }

  void _editField(String field, String initialValue, Function(String) onSaved) {
    TextEditingController controller =
        TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter $field',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSaved(controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

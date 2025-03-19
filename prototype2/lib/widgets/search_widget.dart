import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final Function(String) onSearch;
  SearchWidget({required this.onSearch});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: () {
              widget.onSearch(_controller.text);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

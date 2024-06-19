// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app/services/api_services.dart';
import '../models/genre.dart';


class GenreScreen extends StatefulWidget {
  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  late Future<List<Genre>> futureGenres;

  @override
  void initState() {
    super.initState();
    futureGenres = ApiService().fetchGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genres'),
      ),
      body: FutureBuilder<List<Genre>>(
        future: futureGenres,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(child: Text('No genres available'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  // Implement onTap to navigate to details/edit page
                );
              },
            );
          } else {
            return Center(child: Text('No genres available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement navigation to add genre page
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/genre.dart';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:5000';

  Future<List<Genre>> fetchGenres() async {
    final response = await http.get(Uri.parse('$baseUrl/genres'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Genre.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load genres');
    }
  }

  // Similarly define other CRUD methods...
}

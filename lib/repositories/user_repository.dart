// user_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class UserRepository {
  final http.Client _client;

  UserRepository({http.Client? client}) : _client = client ?? http.Client();

  // Fetch user data by ID
  Future<User> getUser(String userId) async {
    final response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'),
    );

    if (response.statusCode == 200) {
      // Parse and return user data
      final Map<String, dynamic> userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      // Throw an error if the request fails
      throw Exception('Failed to load user data');
    }
  }
}

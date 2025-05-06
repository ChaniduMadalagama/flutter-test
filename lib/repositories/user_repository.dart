// user_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/models.dart';

// Chose this approach for simplicity and faster development.
// Combining data fetching and state management in one class reduces complexity, making it easier for smaller apps with minimal data handling.
// It's a good fit for prototypes or small projects, as it avoids managing separate dependencies and additional abstraction.
// This method works well for simple use cases but may need refactoring as the project grows.

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

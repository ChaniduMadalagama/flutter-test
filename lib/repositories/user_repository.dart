// import 'package:http/http.dart' as http;
// import '../models/user.dart';

// // TODO: Implement UserRepository
// // Requirements:
// // - Extract data fetching logic from UserProfileScreen
// // - Implement a method to fetch user by ID
// // - Return a User object instead of Map<String, dynamic>
// // - Handle errors properly

// class UserRepository {
//   final http.Client _client;

//   UserRepository({http.Client? client}) : _client = client ?? http.Client();

//   // TODO: Implement getUser method
//   Future<User> getUser(String userId) async {
//     // TODO: Implement API call to fetch user data
//     throw UnimplementedError('getUser has not been implemented');
//   }
// }

// user_repository.dart
import 'dart:convert'; // For jsonDecode
import 'package:http/http.dart' as http;
import '../models/user.dart';

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

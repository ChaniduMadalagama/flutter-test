// // TODO: Implement a mock search service
// // Requirements:
// // - Create a class that simulates fetching data with a delay
// // - Implement a searchProducts method that returns a Future<List<String>>
// // - Return an empty list for empty queries
// // - Simulate a short delay (500ms)

// class SearchService {
//   // TODO: Implement searchProducts method
//   Future<List<String>> searchProducts(String query) async {
//     // TODO: Add mock product search logic with delay
//     throw UnimplementedError('searchProducts has not been implemented');
//   }
// }

// search_service.dart
class SearchService {
  final List<Map<String, String>> _dummyUsers = [
    {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'phone': '123-456-7890',
    },
    {
      'name': 'Jane Smith',
      'email': 'jane.smith@example.com',
      'phone': '987-654-3210',
    },
    {
      'name': 'Alice Johnson',
      'email': 'alice.johnson@example.com',
      'phone': '555-555-5555',
    },
    {
      'name': 'Bob Brown',
      'email': 'bob.brown@example.com',
      'phone': '444-444-4444',
    },
    {
      'name': 'Charlie White',
      'email': 'charlie.white@example.com',
      'phone': '333-333-3333',
    },
    {
      'name': 'David Green',
      'email': 'david.green@example.com',
      'phone': '222-222-2222',
    },
    {
      'name': 'Eva Black',
      'email': 'eva.black@example.com',
      'phone': '111-111-1111',
    },
    {
      'name': 'Frank Blue',
      'email': 'frank.blue@example.com',
      'phone': '666-666-6666',
    },
    {
      'name': 'Grace Red',
      'email': 'grace.red@example.com',
      'phone': '777-777-7777',
    },
    {
      'name': 'Helen Yellow',
      'email': 'helen.yellow@example.com',
      'phone': '888-888-8888',
    },
  ];

  Future<List<String>> searchUsers(String query) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulate network delay

    if (query.isEmpty) {
      // Return all users if the query is empty
      return _dummyUsers.map((user) => user['name'] ?? 'N/A').toList();
    }

    List<Map<String, String>> filteredUsers =
        _dummyUsers.where((user) {
          return user['name']!.toLowerCase().contains(query.toLowerCase());
        }).toList();

    if (filteredUsers.isEmpty) {
      return [];
    }

    return filteredUsers.map((user) => user['name'] ?? 'N/A').toList();
  }
}

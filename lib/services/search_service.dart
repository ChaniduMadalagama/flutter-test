import 'dart:async';
import 'dart:math';

class SearchService {
  final List<String> _mockData = [
    'Cloud Computing',
    'Machine Learning',
    'Artificial Intelligence',
    'DevOps Practices',
    'CI/CD Pipelines',
    'Database Management',
    'Agile Methodology',
    'Blockchain Technology',
    'Software Architecture',
    'UI Testing',
    'Integration Testing',
    'Security Best Practices',
    'Web Development',
    'Flutter Widgets',
    'Flutter Navigation',
    'Firebase Integration',
    'GraphQL Queries',
    'Serverless Computing',
    'Web API Security',
    'Responsive Design',
    'Mobile Performance Tuning',
    'Data Structures and Algorithms',
    'Version Control with Git',
    'Continuous Integration with GitHub Actions',
    'Flutter for Web',
    'Cross-platform Deployment',
  ];

  final Random _random = Random();

  Future<List<String>> searchItems(String query) async {
    try {
      // Simulate network delay between 200ms and 1000ms
      await Future.delayed(Duration(milliseconds: 200 + _random.nextInt(800)));

      // Simulate random errors (10% chance)
      if (_random.nextDouble() < 0.1) {
        throw Exception('Failed to fetch search results');
      }

      if (query.isEmpty) {
        return [];
      }

      // Filter mock data based on query
      return _mockData
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } catch (e) {
      // Handle the error here (e.g., logging or returning an empty list)
      print('Error: $e');
      return [];
    }
  }
}

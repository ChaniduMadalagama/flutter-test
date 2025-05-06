// // TODO: Implement User model class
// // Requirements:
// // - Create a model class to represent user data
// // - Implement fromJson factory constructor
// // - Include properties for name, email, phone, website, etc.

// class User {
//   // TODO: Add properties

//   // TODO: Add constructor parameters

//   // TODO: Implement fromJson factory constructor
//   factory User.fromJson(Map<String, dynamic> json) {
//     // TODO: Parse JSON and return User instance
//     throw UnimplementedError('User.fromJson has not been implemented');
//   }
// }

// user.dart
class User {
  final String name;
  final String email;
  final String phone;
  final String website;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  });

  // Implement fromJson constructor
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }
}

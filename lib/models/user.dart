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

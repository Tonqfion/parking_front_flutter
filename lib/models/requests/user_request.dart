import 'dart:convert';

class UserRequest {
  final String username;
  final String email;
  final String password;

  UserRequest({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserRequest.fromMap(Map<String, dynamic> map) {
    return UserRequest(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRequest.fromJson(String source) =>
      UserRequest.fromMap(json.decode(source));
}

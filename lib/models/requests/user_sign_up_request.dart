import 'dart:convert';

class UserSignUpRequest {
  final String username;
  final String email;
  final String password;

  UserSignUpRequest({
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

  factory UserSignUpRequest.fromMap(Map<String, dynamic> map) {
    return UserSignUpRequest(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSignUpRequest.fromJson(String source) =>
      UserSignUpRequest.fromMap(json.decode(source));
}

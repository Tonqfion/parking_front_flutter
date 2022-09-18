import 'dart:convert';

class UserRegisterRequest {
  final String username;
  final String email;
  final String password;

  UserRegisterRequest({
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

  factory UserRegisterRequest.fromMap(Map<String, dynamic> map) {
    return UserRegisterRequest(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRegisterRequest.fromJson(String source) =>
      UserRegisterRequest.fromMap(json.decode(source));
}

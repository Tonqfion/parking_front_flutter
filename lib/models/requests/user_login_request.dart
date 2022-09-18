import 'dart:convert';

class UserLoginRequest {
  final String email;
  final String password;

  UserLoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserLoginRequest.fromMap(Map<String, dynamic> map) {
    return UserLoginRequest(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginRequest.fromJson(String source) =>
      UserLoginRequest.fromMap(json.decode(source));
}

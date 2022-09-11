import 'dart:convert';

class UserSignInRequest {
  final String email;
  final String password;

  UserSignInRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserSignInRequest.fromMap(Map<String, dynamic> map) {
    return UserSignInRequest(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSignInRequest.fromJson(String source) =>
      UserSignInRequest.fromMap(json.decode(source));
}

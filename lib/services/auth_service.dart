import 'package:http/http.dart' as http;
import 'package:parking/constants/global_variables.dart';

import '../models/requests/user_request.dart';

class AuthService {
  // User registration
  void signUpUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserRequest userRequest = UserRequest(
        username: username,
        email: email,
        password: password,
      );
      http.post(Uri.parse('$uri/api/signup'));
    } on Exception catch (e) {}
  }
}

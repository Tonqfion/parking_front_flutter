import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parking/constants/error_handling.dart';
import 'package:parking/constants/global_variables.dart';
import 'package:parking/constants/utils.dart';
import 'package:parking/models/requests/user_login_request.dart';
import 'package:parking/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/requests/user_register_request.dart';
import '../../profile/widgets/profile_bar.dart';

class AuthService {
  // User registration
  void registerUser({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserRegisterRequest userRegisterRequest = UserRegisterRequest(
        username: username,
        email: email,
        password: password,
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: userRegisterRequest.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charseft=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Compte enregistrĂ©");
        },
      );
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserLoginRequest userLoginRequest = UserLoginRequest(
        email: email,
        password: password,
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: userLoginRequest.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charseft=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          Navigator.pushNamedAndRemoveUntil(
            context,
            ProfileBar.routeName,
            (route) => false,
          );
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("x-auth-token", jsonDecode(res.body)['token']);
        },
      );
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserdata(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      final tokenResponse = await http.post(
        Uri.parse(
          '$uri/api/token',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charseft=UTF-8',
          'x-auth-token': token!,
        },
      );
      final response = jsonDecode(tokenResponse.body);

      if (response) {
        // get user data
        http.Response userResponse = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charseft=UTF-8',
            'x-auth-token': token,
          },
        );
        userProvider.setUser(userResponse.body);
      }
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

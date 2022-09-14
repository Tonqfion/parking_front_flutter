import 'package:flutter/material.dart';
import 'package:parking/constants/utils.dart';
import 'package:parking/features/guest/widgets/guest_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  void logOut(BuildContext context) async {
    try {
      Navigator.pushNamedAndRemoveUntil(
        context,
        GuestBar.routeName,
        (route) => false,
      );
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<bool> deleteUserAccount({required BuildContext context}) async {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<void> storeUserDetails(
    String userName,
    String email,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    try {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password and Confirm Password does not match "),
          ),
        );
        return;
      }
      SharedPreferences preferences = await SharedPreferences.getInstance();

      await preferences.setString("username", userName);
      await preferences.setString("email", email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Details Stored Sucessfully")),
      );
    } catch (error) {
      error.toString();
    }
  }
}

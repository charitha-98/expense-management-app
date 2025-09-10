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
  // method to check user name saved of not

  static Future<bool> checkUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? userName = preferences.getString('username');
    return userName != null;
  }

  //get the use name and email

  static Future<Map<String, String>> getUserData() async {
    //create a instence for shared preferences

    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? userName = preferences.getString("username");
    String? email = preferences.getString("email");

    return {"username": userName!, "email": email!};
  }
}

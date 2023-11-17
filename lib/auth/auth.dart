import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nerds_project/functions/shared_pref.dart';
import 'package:nerds_project/models/user.dart';
import 'package:nerds_project/widgets/error_alert.dart';

class AuthMethods {
  // Creating a User
  Future<void> createUser(User newUser) async {
    try {
      final response = await http.post(
        Uri.parse("https://fox-current-filly.ngrok-free.app/api/register/"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': newUser.name,
          'email': newUser.email,
          'phoneNumber': newUser.phoneNumber,
          'password': newUser.password,
        }),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        final id = responseData['user_id'];
        SharedPrefHelper().saveUserID(id);
        SharedPrefHelper().saveEmail(newUser.email!);
        SharedPrefHelper().saveName(newUser.name!);
      } else {
        // Handle errors when user creation fails
        throw Exception(
            'Failed to create user. Status code: ${response.statusCode}');
      }
    } on TimeoutException catch (_) {
      const ErrorAlert(message: '',);
    }
  }

  //Signing in a User
  Future<void> signInUser(User newUser) async {
    final response = await http.post(
      Uri.parse("https://fox-current-filly.ngrok-free.app/api/signin/"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "email": newUser.email,
        'password': newUser.password,
      }),
    );

    if (response.statusCode == 200) {
    } else {
      // Handle errors when user creation fails
      throw Exception(
          'Failed to sign in user. Status code: ${response.statusCode}');
    }
  }
}

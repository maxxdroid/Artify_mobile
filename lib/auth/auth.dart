import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nerds_project/functions/shared_pref.dart';
import 'package:nerds_project/models/user.dart';

class AuthMethods {
  Future<void> createUser(User newUser) async {
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
  }

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
      // User Sign in was successful (status code 201 - Created)
      // print('Response body: ${response.body}');
      // final responseData = json.decode(response.body);
      // final token = responseData['auth_token'];
    } else {
      // Handle errors when user creation fails
      throw Exception(
          'Failed to sign in user. Status code: ${response.statusCode}');
    }
  }
}

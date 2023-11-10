import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper{
  static String iDKey = 'UserIdKey';
  static String nameKey = 'nameKey';
  static String emailKey = 'emailKey';

  Future<bool> saveUserID(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(iDKey, getUserId);
  }

  Future<bool> saveEmail (String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(emailKey, getUserEmail);
  }

  Future<bool> saveName (String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(nameKey, getUserName);
  }

  //get

  Future<String?> getUserID() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(iDKey);
  }

  Future<String?> getUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(nameKey);
  }

  Future<String?> getUserEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey);
  }

}
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAME";
  static String userEmailKey = "USEREMAIL";
  static String userImageKey = "USERIMAGE";

  //  getters for user info
  Future<bool> saveUserId(String getUserId) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveUserImage(String getUserImage) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(userImageKey, getUserImage);
  }

  // setters for user info
  Future<String?> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(userIdKey);
  }

  Future<String?> getUserName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(userEmailKey);
  }

  Future<String?> getUserImage() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(userImageKey);
  }
}

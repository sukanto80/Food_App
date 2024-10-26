import 'package:shared_preferences/shared_preferences.dart';

class MyPrefs {
  static const sellerId = "userIdKH";
  static const userName = "user_name";
  static const userType = "xsgx";
  static const IsSetup = "false";
  SharedPreferences ? preferences;

  static Future<void> setUserType(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userType, authcode);
  }

  static Future<String> getUserType() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(userType) ?? "";
  }
  static Future<void> setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, name);
  }

  static Future<String> getName() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName) ?? "";
  }




  static Future<void> setId(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sellerId, authcode);
  }

  static Future<String> getId() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(sellerId) ?? "";
  }

  static Future<void> is_setup(String issetup ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(IsSetup, issetup);
  }

  static Future<String> get_is_setup() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(IsSetup) ?? "";
  }



}

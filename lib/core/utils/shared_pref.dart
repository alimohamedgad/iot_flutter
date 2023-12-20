import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static late SharedPreferences sharedPref;

  static Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<void> setStringPref(String key, String value) async {
    await sharedPref.setString(key, value);
  }

  static Future<void> getStringPref(String key) async {
    sharedPref.getString(key);
  }
}

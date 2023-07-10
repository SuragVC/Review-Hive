import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesClass {
  boolValueSaveToSharedPrefrence(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> getBoolValuesFromSharedPrefrence(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}

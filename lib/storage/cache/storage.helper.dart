import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static final String token = "TOKEN";
  static final String cookie = "COOKIE";
  static final String login = "LOGIN";
  static final String senha = "SENHA";
}

class StorageHelper {
  static SharedPreferences? _prefs;

  static Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<String?> getString(String key) async {
    await _getInstance();
    return _prefs!.getString(key);
  }

  static Future<bool?> getBool(String key) async {
    await _getInstance();
    return _prefs!.getBool(key);
  }

  static Future<int?> getInt(String key) async {
    await _getInstance();
    return _prefs!.getInt(key);
  }

  static Future<double?> getDouble(String key) async {
    await _getInstance();
    return _prefs!.getDouble(key);
  }

  static void set(String key, dynamic value) async {
    await _getInstance();
    if (value is int) {
      _prefs!.setInt(key, value);
    } else if (value is String) {
      _prefs!.setString(key, value);
    } else if (value is bool) {
      _prefs!.setBool(key, value);
    } else if (value is double){
      _prefs!.setDouble(key, value);
    }
  }

  static void remove(String key) async {
    await _getInstance();
    _prefs!.remove(key);
  }

  static void deletes() async {
    await _getInstance();
    _prefs!.clear();
  }
}

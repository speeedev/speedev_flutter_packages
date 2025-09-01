import 'package:shared_preferences/shared_preferences.dart';

class SDLocalStorageHelper {
  SDLocalStorageHelper._();

  static final SDLocalStorageHelper _instance = SDLocalStorageHelper._();

  factory SDLocalStorageHelper() => _instance;

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setValue<T>(String key, T value) async {
    switch (T) {
      case const (String):
        return await _prefs.setString(key, value as String);
      case const (int):
        return await _prefs.setInt(key, value as int);
      case const (bool):
        return await _prefs.setBool(key, value as bool);
      case const (double):
        return await _prefs.setDouble(key, value as double);
      default:
        throw Exception('Unsupported type: $T');
    }
  }

  Future<T?> getValue<T>(String key) async {
    switch (T) {
      case const (String):
        return _prefs.getString(key) as T?;
      case const (int):
        return _prefs.getInt(key) as T?;
      case const (bool):
        return _prefs.getBool(key) as T?;
      case const (double):
        return _prefs.getDouble(key) as T?;

      default:
        throw Exception('Unsupported type: $T');
    }
  }

  Future<bool> removeValue(String key) async {
    return await _prefs.remove(key);
  }
}

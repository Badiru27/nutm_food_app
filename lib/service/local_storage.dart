import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  final SharedPreferences _preferences;

  const LocalStorageService(this._preferences);

  Future<void> saveToDisk<T>(String key, T content) async {

    if (content is String) {
      await _preferences.setString(key, content);
    }
    if (content is bool) {
      await _preferences.setBool(key, content);
    }
    if (content is int) {
      await _preferences.setInt(key, content);
    }
    if (content is double) {
      await _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await _preferences.setStringList(key, content);
    }
  }

  Object? getFromDisk(String key) {
    final value = _preferences.get(key);
    return value;
  }

  Future<bool> removeFromDisk(String key) async {
    final value = await _preferences.remove(key);
    return value;
  }
}
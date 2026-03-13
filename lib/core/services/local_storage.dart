import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> save(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> read(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }


  Future<void> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(key);
  }


  Future<void> clear() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}

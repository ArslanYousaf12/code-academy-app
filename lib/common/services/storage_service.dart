import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setbool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool? getbool(String key) {
    return _prefs.getBool(key);
  }
}

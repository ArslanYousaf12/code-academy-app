import 'package:code_academy_app/common/values/constants.dart';
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

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  bool isLogedIn() {
    return _prefs.getString(AppConstants.USER_TOKEN_KEY) == null ? false : true;
  }
}

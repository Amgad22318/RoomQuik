import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_shared_preferences_keys.dart';

class MySharedPref {
  late SharedPreferences _preferences;

  Future<SharedPreferences> initSP() async {
    printTest('initSP');
    return _preferences = await SharedPreferences.getInstance();
  }

  void putBoolean({
    required MySharedKeys key,
    required bool value,
  }) async {
    await _preferences.setBool(key.name, value);
  }

  bool? getBoolean({required MySharedKeys key}) {
    return _preferences.getBool(key.name);
  }

  void putString({
    required MySharedKeys key,
    required String? value,
  }) async {
    await _preferences.setString(key.name, value ?? "");
  }

  String getString({required MySharedKeys key}) {
    return _preferences.getString(key.name) ?? "";
  }

  Future<bool>? clearShared() {
    return _preferences.clear();
  }

  String getCurrentLanguage() {
    return _preferences.getString(MySharedKeys.language.name) ?? "en";
  }
}

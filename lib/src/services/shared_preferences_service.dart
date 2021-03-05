import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

enum SharePrefsAttribute {
  IS_DARK,
}

extension ParseToString on SharePrefsAttribute {
  String toShortString() {
    return this.toString().split('.').last.toLowerCase();
  }
}

class SharedPreferencesService {
  late SharedPreferences _prefs;

  Future loadInstance() async => _prefs = await SharedPreferences.getInstance();

  bool? isDark() => _prefs.getBool(SharePrefsAttribute.IS_DARK.toShortString());

  setIsDark(bool value) =>
      _prefs.setBool(SharePrefsAttribute.IS_DARK.toShortString(), value);

  clearPref(SharePrefsAttribute attribute) =>
      _prefs.remove(attribute.toShortString());
}

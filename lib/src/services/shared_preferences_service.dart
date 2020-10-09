import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

enum SharePrefsAttribute{
  IS_DARK,
}

class SharedPreferencesService {
  SharedPreferences _prefs;

  String _getAttributeStr(SharePrefsAttribute attribute){
    return attribute == SharePrefsAttribute.IS_DARK ? 'is_dark'
        : '';
  }

  Future loadInstance() async => _prefs = await SharedPreferences.getInstance();

  bool isDark() => _prefs.getBool(_getAttributeStr(SharePrefsAttribute.IS_DARK));
  setIsDark(bool value) => _prefs.setBool(_getAttributeStr(SharePrefsAttribute.IS_DARK), value);

  clearPref(SharePrefsAttribute attribute) => _prefs.remove(_getAttributeStr(attribute));
}
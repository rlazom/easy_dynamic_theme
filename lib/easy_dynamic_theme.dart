import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/services/shared_preferences_service.dart';
export 'src/widgets/easy_dynamic_theme_btn.dart';

/// Global InheritedWidget to access the data of the plugin
/// Current Theme related data or methods
class EasyDynamicTheme extends InheritedWidget {
  static const MethodChannel _channel =
      const MethodChannel('easy_dynamic_theme');
  final _EasyDynamicThemeWidgetState data;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  const EasyDynamicTheme({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static _EasyDynamicThemeWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EasyDynamicTheme>().data;
  }

  @override
  bool updateShouldNotify(EasyDynamicTheme old) {
    return this != old;
  }
}

/// Widget that will contains the whole app
class EasyDynamicThemeWidget extends StatefulWidget {
  final ThemeMode initialThemeMode;
  final Widget child;

  EasyDynamicThemeWidget({Key key, this.initialThemeMode, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  _EasyDynamicThemeWidgetState createState() => _EasyDynamicThemeWidgetState();
}

class _EasyDynamicThemeWidgetState extends State<EasyDynamicThemeWidget> {
  ThemeMode themeMode;
  SharedPreferencesService _prefs;

  @override
  initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future _loadSharedPreferences() async {
    themeMode = widget.initialThemeMode;
    _prefs = new SharedPreferencesService();
    await _prefs.loadInstance();
    bool isDark = _prefs.isDark();
    if (isDark != null) {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void switchTheme() {
    bool forceDark = _prefs.isDark();

    var newThemeMode = ThemeMode.system;
    var isNewThemeDark;

    if (forceDark == null) {
      newThemeMode = ThemeMode.light;
      isNewThemeDark = false;
    } else {
      if (!forceDark) {
        newThemeMode = ThemeMode.dark;
        isNewThemeDark = true;
      }
    }

    if (isNewThemeDark == null) {
      _prefs.clearPref(SharePrefsAttribute.IS_DARK);
    } else {
      _prefs.setIsDark(isNewThemeDark);
    }

    setState(() {
      themeMode = newThemeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    themeMode = themeMode ?? ThemeMode.system;
    return EasyDynamicTheme(
      data: this,
      child: widget.child,
    );
  }
}

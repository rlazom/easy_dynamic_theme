import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services/shared_preferences_service.dart';
export 'widgets/easy_dynamic_theme_btn.dart';
export 'widgets/easy_dynamic_theme_switch.dart';

/// Global InheritedWidget to access the data of the plugin
/// Current Theme related data or methods
class EasyDynamicTheme extends InheritedWidget {
  static const MethodChannel _channel =
      const MethodChannel('easy_dynamic_theme');
  final _EasyDynamicThemeWidgetState data;

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  const EasyDynamicTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static _EasyDynamicThemeWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EasyDynamicTheme>()!.data;
  }

  @override
  bool updateShouldNotify(EasyDynamicTheme old) {
    return this != old;
  }
}

/// Widget that will contains the whole app
class EasyDynamicThemeWidget extends StatefulWidget {
  final ThemeMode? initialThemeMode;
  final Widget child;

  EasyDynamicThemeWidget({Key? key, this.initialThemeMode, required this.child})
      : super(key: key);

  @override
  _EasyDynamicThemeWidgetState createState() => _EasyDynamicThemeWidgetState();
}

class _EasyDynamicThemeWidgetState extends State<EasyDynamicThemeWidget> {
  ThemeMode? themeMode;
  late SharedPreferencesService _prefs;
  Future? fInit;

  @override
  initState() {
    super.initState();
    fInit = _loadSharedPreferences();
  }

  /// Loads the Shared Preferences data stored on your device to build the UI accordingly
  Future _loadSharedPreferences() async {
    _prefs = new SharedPreferencesService();
    if (widget.initialThemeMode != null) {
      themeMode = widget.initialThemeMode;
      _prefs.loadInstance();
      return;
    }
    await _prefs.loadInstance();
    bool? isDark = _prefs.isDark();
    if (isDark != null) {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  /// Change your current ThemeMode
  ///
  /// If you do not send any parameter it will toggle in the following order:
  ///
  /// dynamic -> light -> dark -> dynamic ->
  ///
  /// Or you can define boolean values for the parameters "[dynamic]" and/or "[dark]"
  ///
  /// If the value of "[dynamic]" is true, it takes precedence over "[dark]"
  void changeTheme({bool? dynamic, bool? dark}) {
    if (dynamic == null && dark == null) {
      _toggleTheme();
      return;
    }

    ThemeMode? newThemeMode;
    bool forceDark = _prefs.isDark() ?? false;

    if (dark != null || dynamic != null) {
      forceDark = dark == null ? forceDark : dark;
      newThemeMode = (dynamic ?? false)
          ? ThemeMode.system
          : forceDark
              ? ThemeMode.dark
              : ThemeMode.light;
    }

    if (newThemeMode == ThemeMode.system) {
      _prefs.clearPref(SharePrefsAttribute.IS_DARK);
    } else {
      _prefs.setIsDark(forceDark);
    }

    setState(() {
      themeMode = newThemeMode;
    });
  }

  /// Toggle from your current ThemeMode in the following order:
  ///
  /// dynamic -> light -> dark -> dynamic ->
  void _toggleTheme() {
    ThemeMode? currentThemeMode = themeMode;
    ThemeMode newThemeMode;
    bool? isNewThemeDark;

    if (currentThemeMode == ThemeMode.system) {
      newThemeMode = ThemeMode.light;
      isNewThemeDark = false;
    } else if (currentThemeMode == ThemeMode.light) {
      newThemeMode = ThemeMode.dark;
      isNewThemeDark = true;
    } else {
      newThemeMode = ThemeMode.system;
      isNewThemeDark = null;
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
    return FutureBuilder(
      future: fInit,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return EasyDynamicTheme(
            data: this,
            child: widget.child,
          );
        }
        return Container();
      },
    );
  }
}

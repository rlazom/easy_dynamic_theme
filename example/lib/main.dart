import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'theme.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sp = await SharedPreferences.getInstance();
  bool isDark = sp.getBool('is_dark');

  ThemeMode initialThemeMode;
  if (isDark != null) {
    initialThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  runApp(
    EasyDynamicThemeWidget(
      initialThemeMode: initialThemeMode,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String title = 'Dynamic Theme';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: lightThemeData,
        darkTheme: darkThemeData,
        themeMode: EasyDynamicTheme.of(context).themeMode,
        home: new MyHomePage(title: title,)
    );
  }
}
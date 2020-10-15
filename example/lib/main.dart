import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'theme.dart';
import 'home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String title = 'EDT - Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: lightThemeData,
        darkTheme: darkThemeData,
        themeMode: EasyDynamicTheme.of(context).themeMode,
        home: new MyHomePage(
          title: title,
        ));
  }
}
